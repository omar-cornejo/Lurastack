# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_appsync_source_api_association                  │
# └──────────────────────────────────────────────────────────────┘
resource "aws_appsync_source_api_association" "this" {

  description                   = ""     # string | optional
  merged_api_arn                = ""     # string | optional+computed
  merged_api_id                 = ""     # string | optional+computed
  source_api_arn                = ""     # string | optional+computed
  source_api_association_config = []     # list(object({ merge_type: string })) | optional+computed
  source_api_id                 = ""     # string | optional+computed

  # arn                           = ""     # string | computed
  # association_id                = ""     # string | computed
  # id                            = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    delete = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    update = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}

