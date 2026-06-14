# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ebs_encryption_by_default                       │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ebs_encryption_by_default" "this" {

  enabled = false  # bool | optional
  id      = ""     # string | optional+computed

}

