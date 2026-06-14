package main

import (
	"encoding/json"
	"fmt"
	"os"
	"path/filepath"
	"sort"
	"strings"
)

type rawProviderSchemas struct {
	FormatVersion   string                       `json:"format_version"`
	ProviderSchemas map[string]rawProviderSchema `json:"provider_schemas"`
}

type rawProviderSchema struct {
	Provider          json.RawMessage            `json:"provider"`
	ResourceSchemas   map[string]json.RawMessage `json:"resource_schemas"`
	DataSourceSchemas map[string]json.RawMessage `json:"data_source_schemas"`
	EphemeralSchemas  map[string]json.RawMessage `json:"ephemeral_resource_schemas"`
	Functions         map[string]json.RawMessage `json:"functions"`
}

func main() {
	args := os.Args[1:]
	schemaPath := "schema.json"
	providerFilter := ""
	if len(args) >= 1 {
		schemaPath = args[0]
	}
	if len(args) >= 2 {
		providerFilter = args[1]
	}

	fmt.Printf("  schema : %s\n", schemaPath)
	if providerFilter != "" {
		fmt.Printf("  filter : '%s'\n", providerFilter)
	}
	fmt.Println()

	raw, err := os.ReadFile(schemaPath)
	if err != nil {
		fmt.Fprintf(os.Stderr, "cannot read %s: %v\n", schemaPath, err)
		os.Exit(1)
	}

	var schemas rawProviderSchemas
	if err := json.Unmarshal(raw, &schemas); err != nil {
		fmt.Fprintf(os.Stderr, "invalid JSON: %v\n", err)
		os.Exit(1)
	}

	baseDir := "json_schemas"

	counts := struct{ providers, res, data, ephemeral, functions int }{}


	providerNames := make([]string, 0, len(schemas.ProviderSchemas))
	for name := range schemas.ProviderSchemas {
		providerNames = append(providerNames, name)
	}
	sort.Strings(providerNames)

	for _, providerName := range providerNames {
		if providerFilter != "" && !strings.Contains(providerName, providerFilter) {
			continue
		}
		provider := schemas.ProviderSchemas[providerName]
		counts.providers++

		safeProvider := strings.NewReplacer("/", "_", "\\", "_").Replace(providerName)
		provDir := filepath.Join(baseDir, safeProvider)

		fmt.Printf("▶  Provider: %s\n", providerName)

		if provider.Provider != nil {
			dir := filepath.Join(provDir, "provider")
			writeJSON(dir, "provider.json", provider.Provider)
		}

		n := writeAll(filepath.Join(provDir, "resources"), provider.ResourceSchemas)
		fmt.Printf("   resources           : %d\n", n)
		counts.res += n

		n = writeAll(filepath.Join(provDir, "data_sources"), provider.DataSourceSchemas)
		fmt.Printf("   data sources        : %d\n", n)
		counts.data += n

		n = writeAll(filepath.Join(provDir, "ephemeral_resources"), provider.EphemeralSchemas)
		fmt.Printf("   ephemeral resources : %d\n", n)
		counts.ephemeral += n

		n = writeAll(filepath.Join(provDir, "functions"), provider.Functions)
		fmt.Printf("   functions           : %d\n", n)
		counts.functions += n

		fmt.Println()
	}
}

func writeAll(dir string, m map[string]json.RawMessage) int {
	if len(m) == 0 {
		return 0
	}
	names := make([]string, 0, len(m))
	for name := range m {
		names = append(names, name)
	}
	sort.Strings(names)

	for _, name := range names {
		writeJSON(dir, name+".json", m[name])
	}
	return len(names)
}

func writeJSON(dir, filename string, raw json.RawMessage) {
	if err := os.MkdirAll(dir, 0755); err != nil {
		fmt.Fprintf(os.Stderr, "mkdir %s: %v\n", dir, err)
		return
	}

	var buf interface{}
	if err := json.Unmarshal(raw, &buf); err != nil {
		_ = os.WriteFile(filepath.Join(dir, filename), raw, 0644)
		return
	}
	pretty, err := json.MarshalIndent(buf, "", "  ")
	if err != nil {
		_ = os.WriteFile(filepath.Join(dir, filename), raw, 0644)
		return
	}
	pretty = append(pretty, '\n')

	path := filepath.Join(dir, filename)
	if err := os.WriteFile(path, pretty, 0644); err != nil {
		fmt.Fprintf(os.Stderr, "write %s: %v\n", path, err)
	}
}
