# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_redshift_usage_limit                            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_redshift_usage_limit" "this" {

  amount             = 0      # number | required
  cluster_identifier = ""     # string | required
  feature_type       = ""     # string | required
  limit_type         = ""     # string | required
  breach_action      = ""     # string | optional
  id                 = ""     # string | optional+computed
  period             = ""     # string | optional
  tags               = {}     # map(string) | optional
  tags_all           = {}     # map(string) | optional+computed

  # arn                = ""     # string | computed

}

