# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_iot_ca_certificate                              │
# └──────────────────────────────────────────────────────────────┘
resource "aws_iot_ca_certificate" "this" {

  active                       = false  # bool | required
  allow_auto_registration      = false  # bool | required
  ca_certificate_pem           = ""     # string | required+sensitive
  certificate_mode             = ""     # string | optional
  id                           = ""     # string | optional+computed
  tags                         = {}     # map(string) | optional
  tags_all                     = {}     # map(string) | optional+computed
  verification_certificate_pem = ""     # string | optional+sensitive

  # arn                          = ""     # string | computed
  # customer_version             = 0      # number | computed
  # generation_id                = ""     # string | computed
  # validity = [  # list(object)
  #   {
  #     not_after = ""
  #     not_before = ""
  #   }
  # ]

  registration_config { # list [0..1]
    role_arn      = ""     # string | optional
    template_body = ""     # string | optional
    template_name = ""     # string | optional

  }

}

