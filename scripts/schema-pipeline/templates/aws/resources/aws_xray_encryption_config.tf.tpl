# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_xray_encryption_config                          │
# └──────────────────────────────────────────────────────────────┘
resource "aws_xray_encryption_config" "this" {

  type   = ""     # string | required
  id     = ""     # string | optional+computed
  key_id = ""     # string | optional

}

