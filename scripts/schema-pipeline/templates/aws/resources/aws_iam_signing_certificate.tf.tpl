# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_iam_signing_certificate                         │
# └──────────────────────────────────────────────────────────────┘
resource "aws_iam_signing_certificate" "this" {

  certificate_body = ""     # string | required
  user_name        = ""     # string | required
  id               = ""     # string | optional+computed
  status           = ""     # string | optional

  # certificate_id   = ""     # string | computed

}

