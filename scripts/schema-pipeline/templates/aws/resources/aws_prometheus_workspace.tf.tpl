# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_prometheus_workspace                            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_prometheus_workspace" "this" {

  alias               = ""     # string | optional
  id                  = ""     # string | optional+computed
  kms_key_arn         = ""     # string | optional
  tags                = {}     # map(string) | optional
  tags_all            = {}     # map(string) | optional+computed

  # arn                 = ""     # string | computed
  # prometheus_endpoint = ""     # string | computed

  logging_configuration { # list [0..1]
    log_group_arn = ""     # string | required

  }

}

