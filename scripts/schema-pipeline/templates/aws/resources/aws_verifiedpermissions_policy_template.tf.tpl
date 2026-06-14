# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_verifiedpermissions_policy_template             │
# └──────────────────────────────────────────────────────────────┘
resource "aws_verifiedpermissions_policy_template" "this" {

  policy_store_id    = ""     # string | required
  statement          = ""     # string | required
  description        = ""     # string | optional

  # created_date       = ""     # string | computed
  # id                 = ""     # string | computed
  # policy_template_id = ""     # string | computed

}

