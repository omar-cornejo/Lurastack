# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_iot_domain_configuration                        │
# └──────────────────────────────────────────────────────────────┘
resource "aws_iot_domain_configuration" "this" {

  name                       = ""     # string | required
  application_protocol       = ""     # string | optional+computed
  authentication_type        = ""     # string | optional+computed
  domain_name                = ""     # string | optional+computed
  id                         = ""     # string | optional+computed
  server_certificate_arns    = []     # set(string) | optional
  service_type               = ""     # string | optional
  status                     = ""     # string | optional
  tags                       = {}     # map(string) | optional
  tags_all                   = {}     # map(string) | optional+computed
  validation_certificate_arn = ""     # string | optional

  # arn                        = ""     # string | computed
  # domain_type                = ""     # string | computed

  authorizer_config { # list [0..1]
    allow_authorizer_override = false  # bool | optional
    default_authorizer_name   = ""     # string | optional

  }

  tls_config { # list [0..1]
    security_policy = ""     # string | optional+computed

  }

}

