# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_rds_certificate                                     │
# └──────────────────────────────────────────────────────────────┘
data "aws_rds_certificate" "this" {

  default_for_new_launches     = false  # bool | optional
  id                           = ""     # string | optional+computed
  latest_valid_till            = false  # bool | optional

  # arn                          = ""     # string | computed
  # certificate_type             = ""     # string | computed
  # customer_override            = false  # bool | computed
  # customer_override_valid_till = ""     # string | computed
  # thumbprint                   = ""     # string | computed
  # valid_from                   = ""     # string | computed
  # valid_till                   = ""     # string | computed

}

