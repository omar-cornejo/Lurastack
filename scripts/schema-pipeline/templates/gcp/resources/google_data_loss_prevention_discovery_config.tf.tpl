# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_data_loss_prevention_discovery_config        │
# └──────────────────────────────────────────────────────────────┘
resource "google_data_loss_prevention_discovery_config" "this" {

  location          = ""     # string | required | Location to create the discovery config in.
  parent            = ""     # string | required | The parent of the discovery config in any of the following f…
  display_name      = ""     # string | optional | Display Name (max 1000 Chars)
  id                = ""     # string | optional+computed
  inspect_templates = []     # list(string) | optional | Detection logic for profile generation
  status            = ""     # string | optional | Required. A status for this configuration Possible values: […

  # create_time       = ""     # string | computed | Output only. The creation timestamp of a DiscoveryConfig.
  # errors = [  # list(object)
  #   {
  #     details = [  # list(object)
  #       {
  #         code = 0
  #         details = []  # list(map(string))
  #         message = ""
  #       }
  #     ]
  #     timestamp = ""
  #   }
  # ]
  # last_run_time     = ""     # string | computed | Output only. The timestamp of the last time this config was …
  # name              = ""     # string | computed | Unique resource name for the DiscoveryConfig, assigned by th…
  # update_time       = ""     # string | computed | Output only. The last update timestamp of a DiscoveryConfig.

  actions { # list

    export_data { # list [0..1]

      profile_table { # list [0..1]
        dataset_id = ""     # string | optional | Dataset Id of the table
        project_id = ""     # string | optional | The Google Cloud Platform project ID of the project containi…
        table_id   = ""     # string | optional | Name of the table

      }

    }

    pub_sub_notification { # list [0..1]
      detail_of_message = ""     # string | optional | How much data to include in the pub/sub message. Possible va…
      event             = ""     # string | optional | The type of event that triggers a Pub/Sub. At most one PubSu…
      topic             = ""     # string | optional | Cloud Pub/Sub topic to send notifications to. Format is proj…

      pubsub_condition { # list [0..1]

        expressions { # list [0..1]
          logical_operator = ""     # string | optional | The operator to apply to the collection of conditions Possib…

          conditions { # list
            minimum_risk_score        = ""     # string | optional | The minimum data risk score that triggers the condition. Pos…
            minimum_sensitivity_score = ""     # string | optional | The minimum sensitivity level that triggers the condition. P…

          }

        }

      }

    }

  }

  org_config { # list [0..1]
    project_id = ""     # string | optional | The project that will run the scan. The DLP service account …

    location { # list [0..1]
      folder_id       = ""     # string | optional | The ID for the folder within an organization to scan
      organization_id = ""     # string | optional | The ID of an organization to scan

    }

  }

  targets { # list

    big_query_target { # list [0..1]

      cadence { # list [0..1]

        schema_modified_cadence { # list [0..1]
          frequency = ""     # string | optional | How frequently profiles may be updated when schemas are modi…
          types     = []     # list(string) | optional | The type of events to consider when deciding if the table's …

        }

        table_modified_cadence { # list [0..1]
          frequency = ""     # string | optional | How frequently data profiles can be updated when tables are …
          types     = []     # list(string) | optional | The type of events to consider when deciding if the table ha…

        }

      }

      conditions { # list [0..1]
        created_after   = ""     # string | optional | A timestamp in RFC3339 UTC "Zulu" format with nanosecond res…
        type_collection = ""     # string | optional | Restrict discovery to categories of table types. Currently v…

        or_conditions { # list [0..1]
          min_age       = ""     # string | optional | Duration format. The minimum age a table must have before Cl…
          min_row_count = 0      # number | optional | Minimum number of rows that should be present before Cloud D…

        }

        types { # list [0..1]
          types = []     # list(string) | optional | A set of BiqQuery table types Possible values: ["BIG_QUERY_T…

        }

      }

      disabled {} # list [0..1]

      filter { # list [0..1]

        other_tables {} # list [0..1]

        table_reference { # list [0..1]
          dataset_id = ""     # string | required | Dataset ID of the table.
          table_id   = ""     # string | required | Name of the table.

        }

        tables { # list [0..1]

          include_regexes { # list [0..1]

            patterns { # list
              dataset_id_regex = ""     # string | optional | if unset, this property matches all datasets
              project_id_regex = ""     # string | optional | For organizations, if unset, will match all projects. Has no…
              table_id_regex   = ""     # string | optional | if unset, this property matches all tables

            }

          }

        }

      }

    }

    cloud_sql_target { # list [0..1]

      conditions { # list [0..1]
        database_engines = []     # list(string) | optional | Database engines that should be profiled. Optional. Defaults…
        types            = []     # list(string) | optional | Data profiles will only be generated for the database resour…

      }

      disabled {} # list [0..1]

      filter { # list [1..1]

        collection { # list [0..1]

          include_regexes { # list [0..1]

            patterns { # list
              database_regex               = ""     # string | optional | Regex to test the database name against. If empty, all datab…
              database_resource_name_regex = ""     # string | optional | Regex to test the database resource's name against. An examp…
              instance_regex               = ""     # string | optional | Regex to test the instance name against. If empty, all insta…
              project_id_regex             = ""     # string | optional | For organizations, if unset, will match all projects. Has no…

            }

          }

        }

        database_resource_reference { # list [0..1]
          database          = ""     # string | required | Required. Name of a database within the instance.
          database_resource = ""     # string | required | Required. Name of a database resource, for example, a table …
          instance          = ""     # string | required | Required. The instance where this resource is located. For e…
          project_id        = ""     # string | required | Required. If within a project-level config, then this must m…

        }

        others {} # list [0..1]

      }

      generation_cadence { # list [0..1]
        refresh_frequency = ""     # string | optional | Data changes (non-schema changes) in Cloud SQL tables can't …

        schema_modified_cadence { # list [0..1]
          frequency = ""     # string | optional | Frequency to regenerate data profiles when the schema is mod…
          types     = []     # list(string) | optional | The types of schema modifications to consider. Defaults to N…

        }

      }

    }

    cloud_storage_target { # list [0..1]

      conditions { # list [0..1]
        created_after = ""     # string | optional | File store must have been created after this date. Used to a…
        min_age       = ""     # string | optional | Duration format. Minimum age a file store must have. If set,…

        cloud_storage_conditions { # list [0..1]
          included_bucket_attributes = []     # list(string) | optional | Only objects with the specified attributes will be scanned. …
          included_object_attributes = []     # list(string) | optional | Only objects with the specified attributes will be scanned. …

        }

      }

      disabled {} # list [0..1]

      filter { # list [1..1]

        cloud_storage_resource_reference { # list [0..1]
          bucket_name = ""     # string | optional | The bucket to scan.
          project_id  = ""     # string | optional | If within a project-level config, then this must match the c…

        }

        collection { # list [0..1]

          include_regexes { # list [0..1]

            patterns { # list

              cloud_storage_regex { # list [0..1]
                bucket_name_regex = ""     # string | optional | Regex to test the bucket name against. If empty, all buckets…
                project_id_regex  = ""     # string | optional | For organizations, if unset, will match all projects.

              }

            }

          }

        }

        others {} # list [0..1]

      }

      generation_cadence { # list [0..1]
        refresh_frequency = ""     # string | optional | Data changes in Cloud Storage can't trigger reprofiling. If …

        inspect_template_modified_cadence { # list [0..1]
          frequency = ""     # string | optional | How frequently data profiles can be updated when the templat…

        }

      }

    }

    secrets_target {} # list [0..1]

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

