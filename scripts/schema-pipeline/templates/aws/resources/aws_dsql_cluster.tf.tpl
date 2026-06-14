# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_dsql_cluster                                    │
# └──────────────────────────────────────────────────────────────┘
resource "aws_dsql_cluster" "this" {

  deletion_protection_enabled = false  # bool | optional
  kms_encryption_key          = ""     # string | optional+computed
  tags                        = {}     # map(string) | optional

  # arn                         = ""     # string | computed
  # encryption_details = [  # list(object)
  #   {
  #     encryption_status = ""
  #     encryption_type = ""
  #   }
  # ]
  # identifier                  = ""     # string | computed
  # tags_all                    = {}     # map(string) | computed
  # vpc_endpoint_service_name   = ""     # string | computed

  multi_region_properties { # list
    clusters       = []     # set(string) | optional+computed
    witness_region = ""     # string | optional

  }

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    delete = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    update = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}

