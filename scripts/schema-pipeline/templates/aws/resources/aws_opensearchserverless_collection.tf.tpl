# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_opensearchserverless_collection                 │
# └──────────────────────────────────────────────────────────────┘
resource "aws_opensearchserverless_collection" "this" {

  name                = ""     # string | required | Name of the collection.
  description         = ""     # string | optional | Description of the collection.
  standby_replicas    = ""     # string | optional+computed | Indicates whether standby replicas should be used for a coll…
  tags                = {}     # map(string) | optional
  type                = ""     # string | optional+computed | Type of collection. One of `SEARCH`, `TIMESERIES`, or `VECTO…

  # arn                 = ""     # string | computed
  # collection_endpoint = ""     # string | computed | Collection-specific endpoint used to submit index, search, a…
  # dashboard_endpoint  = ""     # string | computed | Collection-specific endpoint used to access OpenSearch Dashb…
  # id                  = ""     # string | computed
  # kms_key_arn         = ""     # string | computed | The ARN of the Amazon Web Services KMS key used to encrypt t…
  # tags_all            = {}     # map(string) | computed

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    delete = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}

