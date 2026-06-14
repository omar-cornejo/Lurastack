# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_bcmdataexports_export                           │
# └──────────────────────────────────────────────────────────────┘
resource "aws_bcmdataexports_export" "this" {

  tags     = {}     # map(string) | optional

  # id       = ""     # string | computed
  # tags_all = {}     # map(string) | computed

  export { # list
    name        = ""     # string | required
    description = ""     # string | optional

    # export_arn  = ""     # string | computed

    data_query { # list
      query_statement      = ""     # string | required
      table_configurations = {}     # map(map(string)) | optional

    }

    destination_configurations { # list

      s3_destination { # list
        s3_bucket = ""     # string | required
        s3_prefix = ""     # string | required
        s3_region = ""     # string | required

        s3_output_configurations { # list
          compression = ""     # string | required
          format      = ""     # string | required
          output_type = ""     # string | required
          overwrite   = ""     # string | required

        }

      }

    }

    refresh_cadence { # list
      frequency = ""     # string | required

    }

  }

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    update = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}

