# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_dataexchange_revision_assets                    │
# └──────────────────────────────────────────────────────────────┘
resource "aws_dataexchange_revision_assets" "this" {

  data_set_id   = ""     # string | required
  comment       = ""     # string | optional
  finalized     = false  # bool | optional+computed
  force_destroy = false  # bool | optional
  tags          = {}     # map(string) | optional

  # arn           = ""     # string | computed
  # created_at    = ""     # string | computed
  # id            = ""     # string | computed
  # tags_all      = {}     # map(string) | computed
  # updated_at    = ""     # string | computed

  asset { # set

    # arn        = ""     # string | computed
    # created_at = ""     # string | computed
    # id         = ""     # string | computed
    # name       = ""     # string | computed
    # updated_at = ""     # string | computed

    create_s3_data_access_from_s3_bucket { # list

      # access_point_alias = ""     # string | computed
      # access_point_arn   = ""     # string | computed

      asset_source { # list
        bucket       = ""     # string | required
        key_prefixes = []     # set(string) | optional
        keys         = []     # set(string) | optional

        kms_keys_to_grant { # list
          kms_key_arn = ""     # string | required

        }

      }

    }

    import_assets_from_s3 { # list

      asset_source { # list
        bucket = ""     # string | required
        key    = ""     # string | required

      }

    }

    import_assets_from_signed_url { # list
      filename = ""     # string | required

    }

  }

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}

