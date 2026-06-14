# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_s3control_storage_lens_configuration            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_s3control_storage_lens_configuration" "this" {

  config_id  = ""     # string | required
  account_id = ""     # string | optional+computed
  id         = ""     # string | optional+computed
  tags       = {}     # map(string) | optional
  tags_all   = {}     # map(string) | optional+computed

  # arn        = ""     # string | computed

  storage_lens_configuration { # list [1..1]
    enabled = false  # bool | required

    account_level { # list [1..1]

      activity_metrics { # list [0..1]
        enabled = false  # bool | optional

      }

      advanced_cost_optimization_metrics { # list [0..1]
        enabled = false  # bool | optional

      }

      advanced_data_protection_metrics { # list [0..1]
        enabled = false  # bool | optional

      }

      bucket_level { # list [1..1]

        activity_metrics { # list [0..1]
          enabled = false  # bool | optional

        }

        advanced_cost_optimization_metrics { # list [0..1]
          enabled = false  # bool | optional

        }

        advanced_data_protection_metrics { # list [0..1]
          enabled = false  # bool | optional

        }

        detailed_status_code_metrics { # list [0..1]
          enabled = false  # bool | optional

        }

        prefix_level { # list [0..1]

          storage_metrics { # list [1..1]
            enabled = false  # bool | optional

            selection_criteria { # list [0..1]
              delimiter                    = ""     # string | optional
              max_depth                    = 0      # number | optional
              min_storage_bytes_percentage = 0      # number | optional

            }

          }

        }

      }

      detailed_status_code_metrics { # list [0..1]
        enabled = false  # bool | optional

      }

    }

    aws_org { # list [0..1]
      arn = ""     # string | required

    }

    data_export { # list [0..1]

      cloud_watch_metrics { # list [0..1]
        enabled = false  # bool | required

      }

      s3_bucket_destination { # list [0..1]
        account_id            = ""     # string | required
        arn                   = ""     # string | required
        format                = ""     # string | required
        output_schema_version = ""     # string | required
        prefix                = ""     # string | optional

        encryption { # list [0..1]

          sse_kms { # list [0..1]
            key_id = ""     # string | required

          }

          sse_s3 {} # list

        }

      }

    }

    exclude { # list [0..1]
      buckets = []     # set(string) | optional
      regions = []     # set(string) | optional

    }

    include { # list [0..1]
      buckets = []     # set(string) | optional
      regions = []     # set(string) | optional

    }

  }

}

