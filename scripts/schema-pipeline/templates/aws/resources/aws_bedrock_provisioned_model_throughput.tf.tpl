# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_bedrock_provisioned_model_throughput            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_bedrock_provisioned_model_throughput" "this" {

  model_arn              = ""     # string | required
  model_units            = 0      # number | required
  provisioned_model_name = ""     # string | required
  commitment_duration    = ""     # string | optional
  tags                   = {}     # map(string) | optional

  # id                     = ""     # string | computed
  # provisioned_model_arn  = ""     # string | computed
  # tags_all               = {}     # map(string) | computed

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}

