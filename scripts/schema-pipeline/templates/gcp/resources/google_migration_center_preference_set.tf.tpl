# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_migration_center_preference_set              │
# └──────────────────────────────────────────────────────────────┘
resource "google_migration_center_preference_set" "this" {

  location          = ""     # string | required | Part of 'parent'. See documentation of 'projectsId'.
  preference_set_id = ""     # string | required | Required. User specified ID for the preference set. It will …
  description       = ""     # string | optional | A description of the preference set.
  display_name      = ""     # string | optional | User-friendly display name. Maximum length is 63 characters.
  id                = ""     # string | optional+computed
  project           = ""     # string | optional+computed

  # create_time       = ""     # string | computed | Output only. The timestamp when the preference set was creat…
  # name              = ""     # string | computed | Output only. Name of the preference set.
  # update_time       = ""     # string | computed | Output only. The timestamp when the preference set was last …

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

  virtual_machine_preferences { # list [0..1]
    commitment_plan              = ""     # string | optional | Commitment plan to consider when calculating costs for virtu…
    sizing_optimization_strategy = ""     # string | optional | Sizing optimization strategy specifies the preferred strateg…
    target_product               = ""     # string | optional | Target product for assets using this preference set. Specify…

    compute_engine_preferences { # list [0..1]
      license_type = ""     # string | optional | License type to consider when calculating costs for virtual …

      machine_preferences { # list [0..1]

        allowed_machine_series { # list
          code = ""     # string | optional | Code to identify a Compute Engine machine series. Consult ht…

        }

      }

    }

    region_preferences { # list [0..1]
      preferred_regions = []     # list(string) | optional | A list of preferred regions, ordered by the most preferred r…

    }

    sole_tenancy_preferences { # list [0..1]
      commitment_plan         = ""     # string | optional | Commitment plan to consider when calculating costs for virtu…
      cpu_overcommit_ratio    = 0      # number | optional | CPU overcommit ratio. Acceptable values are between 1.0 and …
      host_maintenance_policy = ""     # string | optional | Sole Tenancy nodes maintenance policy. Possible values: 'HOS…

      node_types { # list
        node_name = ""     # string | optional | Name of the Sole Tenant node. Consult https://cloud.google.c…

      }

    }

    vmware_engine_preferences { # list [0..1]
      commitment_plan                         = ""     # string | optional | Commitment plan to consider when calculating costs for virtu…
      cpu_overcommit_ratio                    = 0      # number | optional | CPU overcommit ratio. Acceptable values are between 1.0 and …
      memory_overcommit_ratio                 = 0      # number | optional | Memory overcommit ratio. Acceptable values are 1.0, 1.25, 1.…
      storage_deduplication_compression_ratio = 0      # number | optional | The Deduplication and Compression ratio is based on the logi…

    }

  }

}

