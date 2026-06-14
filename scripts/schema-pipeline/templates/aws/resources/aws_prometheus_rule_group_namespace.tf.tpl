# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_prometheus_rule_group_namespace                 │
# └──────────────────────────────────────────────────────────────┘
resource "aws_prometheus_rule_group_namespace" "this" {

  data         = ""     # string | required
  name         = ""     # string | required
  workspace_id = ""     # string | required
  id           = ""     # string | optional+computed
  tags         = {}     # map(string) | optional
  tags_all     = {}     # map(string) | optional+computed

  # arn          = ""     # string | computed

}

