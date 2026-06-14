# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_kms_key_policy                                  │
# └──────────────────────────────────────────────────────────────┘
resource "aws_kms_key_policy" "this" {

  key_id                             = ""     # string | required
  policy                             = ""     # string | required
  bypass_policy_lockout_safety_check = false  # bool | optional
  id                                 = ""     # string | optional+computed

}

