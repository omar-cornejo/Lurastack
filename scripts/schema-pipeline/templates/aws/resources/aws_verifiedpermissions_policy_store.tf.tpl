# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_verifiedpermissions_policy_store                │
# └──────────────────────────────────────────────────────────────┘
resource "aws_verifiedpermissions_policy_store" "this" {

  description     = ""     # string | optional
  tags            = {}     # map(string) | optional

  # arn             = ""     # string | computed
  # id              = ""     # string | computed
  # policy_store_id = ""     # string | computed
  # tags_all        = {}     # map(string) | computed

  validation_settings { # list
    mode = ""     # string | required

  }

}

