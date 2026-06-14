# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_ssm_document                                        │
# └──────────────────────────────────────────────────────────────┘
data "aws_ssm_document" "this" {

  name             = ""     # string | required
  document_format  = ""     # string | optional
  document_version = ""     # string | optional
  id               = ""     # string | optional+computed

  # arn              = ""     # string | computed
  # content          = ""     # string | computed
  # document_type    = ""     # string | computed

}

