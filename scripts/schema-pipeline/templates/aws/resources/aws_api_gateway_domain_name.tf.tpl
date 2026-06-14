# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_api_gateway_domain_name                         │
# └──────────────────────────────────────────────────────────────┘
resource "aws_api_gateway_domain_name" "this" {

  domain_name                            = ""     # string | required
  certificate_arn                        = ""     # string | optional
  certificate_body                       = ""     # string | optional
  certificate_chain                      = ""     # string | optional
  certificate_name                       = ""     # string | optional
  certificate_private_key                = ""     # string | optional+sensitive
  id                                     = ""     # string | optional+computed
  ownership_verification_certificate_arn = ""     # string | optional+computed
  policy                                 = ""     # string | optional
  regional_certificate_arn               = ""     # string | optional
  regional_certificate_name              = ""     # string | optional
  security_policy                        = ""     # string | optional+computed
  tags                                   = {}     # map(string) | optional
  tags_all                               = {}     # map(string) | optional+computed

  # arn                                    = ""     # string | computed
  # certificate_upload_date                = ""     # string | computed
  # cloudfront_domain_name                 = ""     # string | computed
  # cloudfront_zone_id                     = ""     # string | computed
  # domain_name_id                         = ""     # string | computed
  # regional_domain_name                   = ""     # string | computed
  # regional_zone_id                       = ""     # string | computed

  endpoint_configuration { # list [0..1]
    types           = []     # list(string) | required
    ip_address_type = ""     # string | optional+computed

  }

  mutual_tls_authentication { # list [0..1]
    truststore_uri     = ""     # string | required
    truststore_version = ""     # string | optional

  }

}

