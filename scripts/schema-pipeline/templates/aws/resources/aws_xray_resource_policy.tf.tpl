# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_xray_resource_policy                            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_xray_resource_policy" "this" {

  policy_document             = ""     # string | required
  policy_name                 = ""     # string | required
  bypass_policy_lockout_check = false  # bool | optional
  policy_revision_id          = ""     # string | optional+computed

  # last_updated_time           = ""     # string | computed

}

