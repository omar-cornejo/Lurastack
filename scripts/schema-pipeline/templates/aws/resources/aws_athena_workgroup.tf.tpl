# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_athena_workgroup                                │
# └──────────────────────────────────────────────────────────────┘
resource "aws_athena_workgroup" "this" {

  name          = ""     # string | required
  description   = ""     # string | optional
  force_destroy = false  # bool | optional
  id            = ""     # string | optional+computed
  state         = ""     # string | optional
  tags          = {}     # map(string) | optional
  tags_all      = {}     # map(string) | optional+computed

  # arn           = ""     # string | computed

  configuration { # list [0..1]
    bytes_scanned_cutoff_per_query     = 0      # number | optional
    enforce_workgroup_configuration    = false  # bool | optional
    execution_role                     = ""     # string | optional
    publish_cloudwatch_metrics_enabled = false  # bool | optional
    requester_pays_enabled             = false  # bool | optional

    engine_version { # list [0..1]
      selected_engine_version  = ""     # string | optional

      # effective_engine_version = ""     # string | computed

    }

    result_configuration { # list [0..1]
      expected_bucket_owner = ""     # string | optional
      output_location       = ""     # string | optional

      acl_configuration { # list [0..1]
        s3_acl_option = ""     # string | required

      }

      encryption_configuration { # list [0..1]
        encryption_option = ""     # string | optional
        kms_key_arn       = ""     # string | optional

      }

    }

  }

}

