package main

import (
	"encoding/json"
	"fmt"
	"os"
	"path/filepath"
	"sort"
	"strings"

	tfjson "github.com/hashicorp/terraform-json"
	"github.com/zclconf/go-cty/cty"
)

// ─────────────────────────────────────────────────────────────
// Type helpers
// ─────────────────────────────────────────────────────────────

// fullTypeStr recursively describes a cty.Type, including object field names.
func fullTypeStr(t cty.Type) string {
	switch {
	case t == cty.NilType:
		return "unknown"
	case t == cty.String:
		return "string"
	case t == cty.Number:
		return "number"
	case t == cty.Bool:
		return "bool"
	case t == cty.DynamicPseudoType:
		return "any"
	case t.IsListType():
		return "list(" + fullTypeStr(t.ElementType()) + ")"
	case t.IsSetType():
		return "set(" + fullTypeStr(t.ElementType()) + ")"
	case t.IsMapType():
		return "map(" + fullTypeStr(t.ElementType()) + ")"
	case t.IsObjectType():
		attrTypes := t.AttributeTypes()
		if len(attrTypes) == 0 {
			return "object({})"
		}
		keys := sortedCtyKeys(attrTypes)
		parts := make([]string, 0, len(keys))
		for _, k := range keys {
			parts = append(parts, k+": "+fullTypeStr(attrTypes[k]))
		}
		return "object({ " + strings.Join(parts, ", ") + " })"
	case t.IsTupleType():
		return "tuple"
	default:
		return t.FriendlyName()
	}
}

func sortedCtyKeys(m map[string]cty.Type) []string {
	keys := make([]string, 0, len(m))
	for k := range m {
		keys = append(keys, k)
	}
	sort.Strings(keys)
	return keys
}

// attrTypeStr returns a human-readable type for an attribute,
// handling both AttributeType (cty) and AttributeNestedType.
func attrTypeStr(attr *tfjson.SchemaAttribute) string {
	if attr.AttributeNestedType != nil {
		nat := attr.AttributeNestedType
		switch nat.NestingMode {
		case tfjson.SchemaNestingModeSingle, tfjson.SchemaNestingModeGroup:
			return "object"
		case tfjson.SchemaNestingModeList:
			return "list(object)"
		case tfjson.SchemaNestingModeSet:
			return "set(object)"
		case tfjson.SchemaNestingModeMap:
			return "map(object)"
		default:
			return "object"
		}
	}
	if attr.AttributeType == cty.NilType {
		return "unknown"
	}
	return fullTypeStr(attr.AttributeType)
}

// ─────────────────────────────────────────────────────────────
// Inline metadata comment
// ─────────────────────────────────────────────────────────────

func inlineMeta(attr *tfjson.SchemaAttribute) string {
	ts := attrTypeStr(attr)

	var flags []string
	if attr.Required {
		flags = append(flags, "required")
	}
	if attr.Optional {
		flags = append(flags, "optional")
	}
	if attr.Computed {
		flags = append(flags, "computed")
	}
	if attr.Sensitive {
		flags = append(flags, "sensitive")
	}
	if attr.WriteOnly {
		flags = append(flags, "write_only")
	}
	if attr.Deprecated {
		flags = append(flags, "DEPRECATED")
	}

	desc := strings.ReplaceAll(attr.Description, "\n", " ")
	if len([]rune(desc)) > 60 {
		runes := []rune(desc)
		desc = string(runes[:60]) + "…"
	}

	meta := fmt.Sprintf("# %s | %s", ts, strings.Join(flags, "+"))
	if desc != "" {
		meta += " | " + desc
	}
	return meta
}

// ─────────────────────────────────────────────────────────────
// Default HCL values
// ─────────────────────────────────────────────────────────────

func hclDefault(attr *tfjson.SchemaAttribute) string {
	if attr.AttributeNestedType != nil {
		return "{}"
	}
	if attr.AttributeType == cty.NilType {
		return `""`
	}
	switch {
	case attr.AttributeType == cty.String:
		return `""`
	case attr.AttributeType == cty.Number:
		return "0"
	case attr.AttributeType == cty.Bool:
		return "false"
	case attr.AttributeType.IsMapType(), attr.AttributeType.IsObjectType():
		return "{}"
	case attr.AttributeType.IsListType(), attr.AttributeType.IsSetType():
		return "[]"
	default:
		return `""`
	}
}

// ─────────────────────────────────────────────────────────────
// Block cardinality + nesting mode
// ─────────────────────────────────────────────────────────────

func cardinalityStr(nb *tfjson.SchemaBlockType) string {
	var parts []string

	switch nb.NestingMode {
	case tfjson.SchemaNestingModeSet:
		parts = append(parts, "set")
	case tfjson.SchemaNestingModeList:
		parts = append(parts, "list")
	case tfjson.SchemaNestingModeMap:
		parts = append(parts, "map")
	case tfjson.SchemaNestingModeSingle, tfjson.SchemaNestingModeGroup:
		parts = append(parts, "single")
	}

	min, max := nb.MinItems, nb.MaxItems
	if min != 0 || max != 0 {
		if max == 0 {
			parts = append(parts, fmt.Sprintf("[%d..*]", min))
		} else if min == 0 {
			parts = append(parts, fmt.Sprintf("[0..%d]", max))
		} else {
			parts = append(parts, fmt.Sprintf("[%d..%d]", min, max))
		}
	}

	if len(parts) == 0 {
		return ""
	}
	return " # " + strings.Join(parts, " ")
}

// ─────────────────────────────────────────────────────────────
// Render a computed-only complex attribute as commented HCL
// ─────────────────────────────────────────────────────────────

// isExpandable returns true for types that benefit from structural expansion.
func isExpandable(t cty.Type) bool {
	if t.IsObjectType() {
		return true
	}
	if (t.IsListType() || t.IsSetType()) && t.ElementType().IsObjectType() {
		return true
	}
	return false
}

// renderComputedType writes an expanded commented HCL representation of a cty.Type.
// base:  fixed indent before the `#` (e.g. "  " for a top-level block attribute)
// extra: growing indent after `#` for each nesting level
func renderComputedType(name string, t cty.Type, sb *strings.Builder, base, extra string, depth int) {
	line := func(format string, args ...interface{}) {
		sb.WriteString(base + "# " + extra + fmt.Sprintf(format, args...))
	}
	if depth > 6 {
		line("%s = ...  # %s\n", name, fullTypeStr(t))
		return
	}
	switch {
	case t == cty.String:
		line("%s = \"\"\n", name)
	case t == cty.Number:
		line("%s = 0\n", name)
	case t == cty.Bool:
		line("%s = false\n", name)
	case t.IsMapType():
		line("%s = {}  # map(%s)\n", name, fullTypeStr(t.ElementType()))
	case t.IsObjectType():
		line("%s = {\n", name)
		for _, k := range sortedCtyKeys(t.AttributeTypes()) {
			renderComputedType(k, t.AttributeTypes()[k], sb, base, extra+"  ", depth+1)
		}
		line("}\n")
	case t.IsListType() || t.IsSetType():
		kind := "list"
		if t.IsSetType() {
			kind = "set"
		}
		elem := t.ElementType()
		if elem.IsObjectType() {
			line("%s = [  # %s(object)\n", name, kind)
			sb.WriteString(base + "# " + extra + "  " + "{\n")
			for _, k := range sortedCtyKeys(elem.AttributeTypes()) {
				renderComputedType(k, elem.AttributeTypes()[k], sb, base, extra+"    ", depth+1)
			}
			sb.WriteString(base + "# " + extra + "  " + "}\n")
			line("]\n")
		} else {
			line("%s = []  # %s(%s)\n", name, kind, fullTypeStr(elem))
		}
	default:
		line("%s = ...  # %s\n", name, fullTypeStr(t))
	}
}

// ─────────────────────────────────────────────────────────────
// Render AttributeNestedType as an HCL block
// ─────────────────────────────────────────────────────────────

func renderNestedAttrBlock(name string, attr *tfjson.SchemaAttribute, sb *strings.Builder, indent int) {
	pad := strings.Repeat("  ", indent+1)
	nat := attr.AttributeNestedType

	var modeParts []string
	switch nat.NestingMode {
	case tfjson.SchemaNestingModeList:
		modeParts = append(modeParts, "list")
	case tfjson.SchemaNestingModeSet:
		modeParts = append(modeParts, "set")
	case tfjson.SchemaNestingModeMap:
		modeParts = append(modeParts, "map")
	case tfjson.SchemaNestingModeSingle, tfjson.SchemaNestingModeGroup:
		modeParts = append(modeParts, "single")
	}
	if nat.MinItems != 0 || nat.MaxItems != 0 {
		if nat.MaxItems == 0 {
			modeParts = append(modeParts, fmt.Sprintf("[%d..*]", nat.MinItems))
		} else if nat.MinItems == 0 {
			modeParts = append(modeParts, fmt.Sprintf("[0..%d]", nat.MaxItems))
		} else {
			modeParts = append(modeParts, fmt.Sprintf("[%d..%d]", nat.MinItems, nat.MaxItems))
		}
	}
	card := ""
	if len(modeParts) > 0 {
		card = " # " + strings.Join(modeParts, " ")
	}

	sb.WriteString(fmt.Sprintf("%s%s {%s\n", pad, name, card))

	innerPad := strings.Repeat("  ", indent+2)
	type nestedAttrEntry struct {
		name string
		attr *tfjson.SchemaAttribute
	}
	var entries []nestedAttrEntry
	for k, a := range nat.Attributes {
		entries = append(entries, nestedAttrEntry{k, a})
	}
	sort.Slice(entries, func(i, j int) bool {
		ri := func(a *tfjson.SchemaAttribute) int {
			if a.Required {
				return 0
			}
			if a.Optional {
				return 1
			}
			return 2
		}
		ri_i, ri_j := ri(entries[i].attr), ri(entries[j].attr)
		if ri_i != ri_j {
			return ri_i < ri_j
		}
		return entries[i].name < entries[j].name
	})

	maxLen := 0
	for _, e := range entries {
		if len(e.name) > maxLen {
			maxLen = len(e.name)
		}
	}

	for _, e := range entries {
		isComputedOnly := e.attr.Computed && !e.attr.Optional && !e.attr.Required
		meta := inlineMeta(e.attr)
		namePad := strings.Repeat(" ", maxLen-len(e.name))
		if isComputedOnly {
			sb.WriteString(fmt.Sprintf("%s# %s%s = ... %s\n", innerPad, e.name, namePad, meta))
		} else {
			val := hclDefault(e.attr)
			valPad := ""
			if len(val) < 6 {
				valPad = strings.Repeat(" ", 6-len(val))
			}
			sb.WriteString(fmt.Sprintf("%s%s%s = %s%s %s\n", innerPad, e.name, namePad, val, valPad, meta))
		}
	}
	sb.WriteString(fmt.Sprintf("%s}\n\n", pad))
}

// ─────────────────────────────────────────────────────────────
// Main HCL block renderer
// ─────────────────────────────────────────────────────────────

func renderBlockManual(block *tfjson.SchemaBlock, sb *strings.Builder, indent int) {
	pad := strings.Repeat("  ", indent+1)

	type attrEntry struct {
		name string
		attr *tfjson.SchemaAttribute
	}

	var settable, computedOnly []attrEntry
	for name, attr := range block.Attributes {
		isComputedOnly := attr.Computed && !attr.Optional && !attr.Required
		if isComputedOnly {
			computedOnly = append(computedOnly, attrEntry{name, attr})
		} else {
			settable = append(settable, attrEntry{name, attr})
		}
	}

	rankAttr := func(a *tfjson.SchemaAttribute) int {
		if a.Required {
			return 0
		}
		if a.Optional {
			return 1
		}
		return 2
	}
	sortAttrs := func(entries []attrEntry) {
		sort.Slice(entries, func(i, j int) bool {
			ri, rj := rankAttr(entries[i].attr), rankAttr(entries[j].attr)
			if ri != rj {
				return ri < rj
			}
			return entries[i].name < entries[j].name
		})
	}
	sortAttrs(settable)
	sortAttrs(computedOnly)

	// Calculate max name length across all attrs for alignment
	maxLen := 0
	for _, e := range settable {
		if len(e.name) > maxLen {
			maxLen = len(e.name)
		}
	}
	for _, e := range computedOnly {
		if len(e.name) > maxLen {
			maxLen = len(e.name)
		}
	}

	// ── Settable attributes ──
	for _, e := range settable {
		name, attr := e.name, e.attr
		namePad := strings.Repeat(" ", maxLen-len(name))

		if attr.AttributeNestedType != nil {
			// Render as inline block
			renderNestedAttrBlock(name, attr, sb, indent)
			continue
		}

		meta := inlineMeta(attr)
		val := hclDefault(attr)
		valPad := ""
		if len(val) < 6 {
			valPad = strings.Repeat(" ", 6-len(val))
		}
		sb.WriteString(fmt.Sprintf("%s%s%s = %s%s %s\n", pad, name, namePad, val, valPad, meta))
	}

	// ── Computed-only attributes ──
	if len(computedOnly) > 0 {
		sb.WriteString("\n")
		for _, e := range computedOnly {
			name, attr := e.name, e.attr
			namePad := strings.Repeat(" ", maxLen-len(name))

			if attr.AttributeNestedType != nil {
				sb.WriteString(fmt.Sprintf("%s# %s (computed) – %s\n", pad, name, attrTypeStr(attr)))
				continue
			}

			if attr.AttributeType != cty.NilType && isExpandable(attr.AttributeType) {
				renderComputedType(name, attr.AttributeType, sb, pad, "", 0)
			} else {
				meta := inlineMeta(attr)
				val := hclDefault(attr)
				valPad := ""
				if len(val) < 6 {
					valPad = strings.Repeat(" ", 6-len(val))
				}
				sb.WriteString(fmt.Sprintf("%s# %s%s = %s%s %s\n", pad, name, namePad, val, valPad, meta))
			}
		}
	}

	sb.WriteString("\n")

	// ── Nested blocks (block_types) ──
	type nestedEntry struct {
		name   string
		nested *tfjson.SchemaBlockType
	}
	var nestedBlocks []nestedEntry
	for name, nb := range block.NestedBlocks {
		nestedBlocks = append(nestedBlocks, nestedEntry{name, nb})
	}
	sort.Slice(nestedBlocks, func(i, j int) bool {
		return nestedBlocks[i].name < nestedBlocks[j].name
	})

	for _, e := range nestedBlocks {
		name, nb := e.name, e.nested

		card := cardinalityStr(nb)
		var notes []string
		if nb.Block.Deprecated {
			notes = append(notes, "DEPRECATED")
		}
		noteStr := ""
		if len(notes) > 0 {
			if card == "" {
				noteStr = " # " + strings.Join(notes, " ")
			} else {
				noteStr = " " + strings.Join(notes, " ")
			}
		}

		// Empty marker block (no attributes, no nested blocks) — presence is the signal
		if len(nb.Block.Attributes) == 0 && len(nb.Block.NestedBlocks) == 0 {
			sb.WriteString(fmt.Sprintf("%s%s {}%s%s\n\n", pad, name, card, noteStr))
			continue
		}

		sb.WriteString(fmt.Sprintf("%s%s {%s%s\n", pad, name, card, noteStr))
		renderBlockManual(nb.Block, sb, indent+1)
		sb.WriteString(fmt.Sprintf("%s}\n\n", pad))
	}
}

// ─────────────────────────────────────────────────────────────
// Render a full resource/data entry
// ─────────────────────────────────────────────────────────────

func renderEntry(kind, typeName string, block *tfjson.SchemaBlock) string {
	var sb strings.Builder

	bar := strings.Repeat("─", 62)
	sb.WriteString(fmt.Sprintf("# ┌%s┐\n", bar))
	sb.WriteString(fmt.Sprintf("# │  %-60s  │\n", kind+": "+typeName))
	sb.WriteString(fmt.Sprintf("# └%s┘\n", bar))

	if block.Deprecated {
		sb.WriteString("# ⚠ DEPRECATED: this resource type is deprecated\n")
	}

	if kind == "data" {
		sb.WriteString(fmt.Sprintf("data \"%s\" \"this\" {\n\n", typeName))
	} else {
		sb.WriteString(fmt.Sprintf("resource \"%s\" \"this\" {\n\n", typeName))
	}

	renderBlockManual(block, &sb, 0)
	sb.WriteString("}\n\n")
	return sb.String()
}

// ─────────────────────────────────────────────────────────────
// Main
// ─────────────────────────────────────────────────────────────

func main() {
	args := os.Args[1:]
	schemaPath := "schema.json"
	filter := ""
	if len(args) >= 1 {
		schemaPath = args[0]
	}
	if len(args) >= 2 {
		filter = args[1]
	}

	fmt.Println("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
	fmt.Println("  Terraform Schema → HCL Template Generator (Go)")
	fmt.Println("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
	fmt.Printf("  schema : %s\n", schemaPath)
	if filter != "" {
		fmt.Printf("  filter : '%s'\n", filter)
	}
	fmt.Println()

	data, err := os.ReadFile(schemaPath)
	if err != nil {
		fmt.Fprintf(os.Stderr, "cannot read %s: %v\n", schemaPath, err)
		os.Exit(1)
	}

	var schemas tfjson.ProviderSchemas
	if err := json.Unmarshal(data, &schemas); err != nil {
		fmt.Fprintf(os.Stderr, "invalid JSON: %v\n", err)
		os.Exit(1)
	}

	dirRes := filepath.Join("output", "resources")
	dirData := filepath.Join("output", "data_sources")
	os.MkdirAll(dirRes, 0755)
	os.MkdirAll(dirData, 0755)

	totalRes, totalData := 0, 0

	for providerName, provider := range schemas.Schemas {
		fmt.Printf("▶  Provider: %s\n", providerName)

		// ── Resources ──────────────────────────
		var resNames []string
		for name := range provider.ResourceSchemas {
			if filter == "" || strings.Contains(name, filter) {
				resNames = append(resNames, name)
			}
		}
		sort.Strings(resNames)
		fmt.Printf("   resources    : %d\n", len(resNames))

		for _, name := range resNames {
			schema := provider.ResourceSchemas[name]
			hcl := renderEntry("resource", name, schema.Block)
			path := filepath.Join(dirRes, name+".tf.tpl")
			os.WriteFile(path, []byte(hcl), 0644)
			totalRes++
		}

		// ── Data sources ────────────────────────
		var dataNames []string
		for name := range provider.DataSourceSchemas {
			if filter == "" || strings.Contains(name, filter) {
				dataNames = append(dataNames, name)
			}
		}
		sort.Strings(dataNames)
		fmt.Printf("   data sources : %d\n", len(dataNames))

		for _, name := range dataNames {
			schema := provider.DataSourceSchemas[name]
			hcl := renderEntry("data", name, schema.Block)
			path := filepath.Join(dirData, name+".tf.tpl")
			os.WriteFile(path, []byte(hcl), 0644)
			totalData++
		}

		// Combined filter file
		if filter != "" {
			var combined strings.Builder
			for _, name := range resNames {
				combined.WriteString(renderEntry("resource", name, provider.ResourceSchemas[name].Block))
			}
			if combined.Len() > 0 {
				path := filepath.Join(dirRes, "filter__"+filter+".tf.tpl")
				os.WriteFile(path, []byte(combined.String()), 0644)
				fmt.Printf("   combined resources  : %s\n", path)
			}
			var combinedData strings.Builder
			for _, name := range dataNames {
				combinedData.WriteString(renderEntry("data", name, provider.DataSourceSchemas[name].Block))
			}
			if combinedData.Len() > 0 {
				path := filepath.Join(dirData, "filter__"+filter+".tf.tpl")
				os.WriteFile(path, []byte(combinedData.String()), 0644)
				fmt.Printf("   combined data       : %s\n", path)
			}
		}
	}

	fmt.Println()
	fmt.Printf("✔  Done: %d resources + %d data sources\n", totalRes, totalData)
	fmt.Printf("   output/resources/    → %d files\n", totalRes)
	fmt.Printf("   output/data_sources/ → %d files\n", totalData)
}
