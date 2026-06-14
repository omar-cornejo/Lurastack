package main

import (
	"encoding/json"
	"fmt"
	"os"
	"path/filepath"
	"sort"
	"strings"
)

type RawResourceSchema struct {
	Block   RawBlock        `json:"block"`
	Version json.RawMessage `json:"version"`
}

type RawBlock struct {
	Attributes      map[string]RawAttribute `json:"attributes"`
	BlockTypes      map[string]RawBlockType `json:"block_types"`
	Description     string                  `json:"description"`
	DescriptionKind string                  `json:"description_kind"`
}

type RawAttribute struct {
	Type            json.RawMessage `json:"type"`
	Required        bool            `json:"required"`
	Optional        bool            `json:"optional"`
	Computed        bool            `json:"computed"`
	Sensitive       bool            `json:"sensitive"`
	Deprecated      bool            `json:"deprecated"`
	Description     string          `json:"description"`
	DescriptionKind string          `json:"description_kind"`
}

type RawBlockType struct {
	NestingMode string   `json:"nesting_mode"`
	Block       RawBlock `json:"block"`
	MinItems    int      `json:"min_items"`
	MaxItems    int      `json:"max_items"`
}

type Stats struct {
	Files        int
	Errors       int
	Attributes   int
	Computed     int
	Required     int
	Optional     int
	Sensitive    int
	Deprecated   int
	BlockTypes   int
	MaxNestDepth int

	TypeCounts   map[string]int
	UnknownTypes map[string]int

	DeepNestingExamples []string

	ParseErrors []string
}

func newStats() *Stats {
	return &Stats{
		TypeCounts:   make(map[string]int),
		UnknownTypes: make(map[string]int),
	}
}

func classifyType(raw json.RawMessage) string {
	if raw == nil {
		return "nil"
	}
	var v interface{}
	if err := json.Unmarshal(raw, &v); err != nil {
		return "invalid_json"
	}
	return classifyValue(v)
}

func classifyValue(v interface{}) string {
	switch t := v.(type) {
	case string:
		switch t {
		case "string", "bool", "number", "dynamic":
			return t
		default:
			return "unknown_scalar:" + t
		}
	case []interface{}:
		if len(t) < 2 {
			return "short_array"
		}
		kind, _ := t[0].(string)
		switch kind {
		case "list", "set", "map":
			inner := classifyValue(t[1])
			return kind + "(" + inner + ")"
		case "object":
			return "object"
		case "tuple":
			return "tuple"
		default:
			return "unknown_compound:" + kind
		}
	case nil:
		return "null"
	default:
		return fmt.Sprintf("unexpected_type:%T", v)
	}
}

func walkBlock(block RawBlock, path string, depth int, stats *Stats, resourceKey string) {
	if depth > stats.MaxNestDepth {
		stats.MaxNestDepth = depth
	}

	for attrName, attr := range block.Attributes {
		stats.Attributes++
		if attr.Required {
			stats.Required++
		}
		if attr.Optional {
			stats.Optional++
		}
		if attr.Computed {
			stats.Computed++
		}
		if attr.Sensitive {
			stats.Sensitive++
		}
		if attr.Deprecated {
			stats.Deprecated++
		}

		cls := classifyType(attr.Type)
		stats.TypeCounts[cls]++

		if strings.HasPrefix(cls, "unknown_") || strings.HasPrefix(cls, "invalid") ||
			strings.HasPrefix(cls, "short_") || strings.HasPrefix(cls, "unexpected_") {
			key := fmt.Sprintf("%s (attr:%s)", resourceKey, attrName)
			stats.UnknownTypes[cls+" → "+key]++
		}
		_ = attrName
	}

	for btName, bt := range block.BlockTypes {
		stats.BlockTypes++
		btPath := path + "." + btName

		if depth > 0 && len(bt.Block.BlockTypes) > 0 {
			example := fmt.Sprintf("%s: %s (sub-blocks: %v)",
				resourceKey, btPath,
				keys(bt.Block.BlockTypes))
			stats.DeepNestingExamples = append(stats.DeepNestingExamples, example)
		}

		walkBlock(bt.Block, btPath, depth+1, stats, resourceKey)
	}
}

func keys(m map[string]RawBlockType) []string {
	var out []string
	for k := range m {
		out = append(out, k)
	}
	sort.Strings(out)
	return out
}

func main() {
	baseDir := "json_schemas"
	if len(os.Args) >= 2 {
		baseDir = os.Args[1]
	}

	stats := newStats()

	providerEntries, err := os.ReadDir(baseDir)
	if err != nil {
		fmt.Fprintf(os.Stderr, "cannot read %s: %v\n", baseDir, err)
		os.Exit(1)
	}

	kindCounts := map[string]int{}

	for _, provEntry := range providerEntries {
		if !provEntry.IsDir() {
			continue
		}
		provName := provEntry.Name()

		for _, kind := range []string{"resources", "data_sources", "ephemeral_resources", "functions"} {
			kindDir := filepath.Join(baseDir, provName, kind)
			entries, err := os.ReadDir(kindDir)
			if err != nil {
				continue
			}

			for _, entry := range entries {
				if entry.IsDir() || !strings.HasSuffix(entry.Name(), ".json") {
					continue
				}

				stats.Files++
				kindCounts[kind]++

				fpath := filepath.Join(kindDir, entry.Name())
				data, err := os.ReadFile(fpath)
				if err != nil {
					stats.Errors++
					stats.ParseErrors = append(stats.ParseErrors, fmt.Sprintf("READ %s: %v", fpath, err))
					continue
				}

				if kind == "functions" {
					var fn map[string]interface{}
					if err := json.Unmarshal(data, &fn); err != nil {
						stats.Errors++
						stats.ParseErrors = append(stats.ParseErrors, fmt.Sprintf("PARSE %s: %v", fpath, err))
					}
					continue
				}

				var rs RawResourceSchema
				if err := json.Unmarshal(data, &rs); err != nil {
					stats.Errors++
					stats.ParseErrors = append(stats.ParseErrors, fmt.Sprintf("PARSE %s: %v", fpath, err))
					continue
				}

				name := strings.TrimSuffix(entry.Name(), ".json")
				resourceKey := provName + "/" + kind + "/" + name
				walkBlock(rs.Block, "", 0, stats, resourceKey)
			}
		}
	}

	fmt.Println("Terraform Schema Audit Report")
	fmt.Printf("  Schema files scanned  : %d\n", stats.Files)
	if stats.Errors > 0 {
		fmt.Printf("  Parse errors         : %d\n", stats.Errors)
	} else {
		fmt.Printf("  Parse errors         : 0\n")
	}

	fmt.Println("By kind")
	for _, k := range []string{"resources", "data_sources", "ephemeral_resources", "functions"} {
		fmt.Printf("   %-24s : %d\n", k, kindCounts[k])
	}

	fmt.Println("Attribute counts")
	fmt.Printf("   Total attributes      : %d\n", stats.Attributes)
	fmt.Printf("   Required              : %d\n", stats.Required)
	fmt.Printf("   Optional              : %d\n", stats.Optional)
	fmt.Printf("   Computed              : %d\n", stats.Computed)
	fmt.Printf("   Sensitive             : %d\n", stats.Sensitive)
	fmt.Printf("   Deprecated            : %d\n", stats.Deprecated)
	fmt.Printf("   Nested block types    : %d\n", stats.BlockTypes)
	fmt.Printf("   Max nesting depth     : %d\n", stats.MaxNestDepth)

	fmt.Println("Type coverage (all attribute base types)")
	var typeKeys []string
	for k := range stats.TypeCounts {
		typeKeys = append(typeKeys, k)
	}
	sort.Slice(typeKeys, func(i, j int) bool {
		return stats.TypeCounts[typeKeys[i]] > stats.TypeCounts[typeKeys[j]]
	})
	for _, k := range typeKeys {
		prefix := "ok"
		if strings.HasPrefix(k, "unknown_") || strings.HasPrefix(k, "invalid") ||
			strings.HasPrefix(k, "short_") || strings.HasPrefix(k, "unexpected_") || k == "nil" {
			prefix = "warn"
		}
		fmt.Printf("  %-4s %-50s : %d\n", prefix, k, stats.TypeCounts[k])
	}

	if len(stats.UnknownTypes) > 0 {
		fmt.Println("Unrecognized types (need attention)")
		for k := range stats.UnknownTypes {
			fmt.Printf("   %s\n", k)
		}
	} else {
		fmt.Println("All attribute types are fully recognized")
	}

	if len(stats.ParseErrors) > 0 {
		fmt.Println("Parse errors")
		for _, e := range stats.ParseErrors {
			fmt.Printf("   %s\n", e)
		}
	}

	sort.Strings(stats.DeepNestingExamples)
	uniqueSubBlockNames := map[string]int{}
	for _, ex := range stats.DeepNestingExamples {
		parts := strings.SplitN(ex, "sub-blocks: [", 2)
		if len(parts) == 2 {
			names := strings.TrimSuffix(parts[1], "])")
			for _, n := range strings.Split(names, " ") {
				n = strings.Trim(n, " ,]")
				if n != "" {
					uniqueSubBlockNames[n]++
				}
			}
		}
	}

	fmt.Println("Resources with nested blocks inside blocks")
	fmt.Printf("Count: %d resource types affected\n", len(stats.DeepNestingExamples))

	if len(stats.DeepNestingExamples) > 0 {
		fmt.Println("First 20 examples:")
		end := 20
		if len(stats.DeepNestingExamples) < end {
			end = len(stats.DeepNestingExamples)
		}
		for _, ex := range stats.DeepNestingExamples[:end] {
			fmt.Printf("   - %s\n", ex)
		}
		if len(stats.DeepNestingExamples) > 20 {
			fmt.Printf("   ... and %d more\n", len(stats.DeepNestingExamples)-20)
		}
	}
}
