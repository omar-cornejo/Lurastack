# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ebs_default_kms_key                             │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ebs_default_kms_key" "this" {

  key_arn = ""     # string | required
  id      = ""     # string | optional+computed

}

