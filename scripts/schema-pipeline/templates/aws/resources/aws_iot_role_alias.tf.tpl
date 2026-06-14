# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_iot_role_alias                                  │
# └──────────────────────────────────────────────────────────────┘
resource "aws_iot_role_alias" "this" {

  alias               = ""     # string | required
  role_arn            = ""     # string | required
  credential_duration = 0      # number | optional
  id                  = ""     # string | optional+computed
  tags                = {}     # map(string) | optional
  tags_all            = {}     # map(string) | optional+computed

  # arn                 = ""     # string | computed

}

