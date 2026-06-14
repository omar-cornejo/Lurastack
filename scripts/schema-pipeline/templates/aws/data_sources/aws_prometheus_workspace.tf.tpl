# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_prometheus_workspace                                │
# └──────────────────────────────────────────────────────────────┘
data "aws_prometheus_workspace" "this" {

  workspace_id        = ""     # string | required
  id                  = ""     # string | optional+computed
  tags                = {}     # map(string) | optional+computed

  # alias               = ""     # string | computed
  # arn                 = ""     # string | computed
  # created_date        = ""     # string | computed
  # kms_key_arn         = ""     # string | computed
  # prometheus_endpoint = ""     # string | computed
  # status              = ""     # string | computed

}

