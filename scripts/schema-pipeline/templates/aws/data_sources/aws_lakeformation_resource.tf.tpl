# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_lakeformation_resource                              │
# └──────────────────────────────────────────────────────────────┘
data "aws_lakeformation_resource" "this" {

  arn           = ""     # string | required
  id            = ""     # string | optional+computed

  # last_modified = ""     # string | computed
  # role_arn      = ""     # string | computed

}

