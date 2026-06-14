# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_rds_certificate                                 │
# └──────────────────────────────────────────────────────────────┘
resource "aws_rds_certificate" "this" {

  certificate_identifier = ""     # string | required
  id                     = ""     # string | optional+computed

}

