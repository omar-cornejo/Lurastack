# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_redshift_hsm_client_certificate                 │
# └──────────────────────────────────────────────────────────────┘
resource "aws_redshift_hsm_client_certificate" "this" {

  hsm_client_certificate_identifier = ""     # string | required
  id                                = ""     # string | optional+computed
  tags                              = {}     # map(string) | optional
  tags_all                          = {}     # map(string) | optional+computed

  # arn                               = ""     # string | computed
  # hsm_client_certificate_public_key = ""     # string | computed

}

