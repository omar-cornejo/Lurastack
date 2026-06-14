# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_apigatewayv2_domain_name                        │
# └──────────────────────────────────────────────────────────────┘
resource "aws_apigatewayv2_domain_name" "this" {

  domain_name                      = ""     # string | required
  id                               = ""     # string | optional+computed
  tags                             = {}     # map(string) | optional
  tags_all                         = {}     # map(string) | optional+computed

  # api_mapping_selection_expression = ""     # string | computed
  # arn                              = ""     # string | computed

  domain_name_configuration { # list [1..1]
    certificate_arn                        = ""     # string | required
    endpoint_type                          = ""     # string | required
    security_policy                        = ""     # string | required
    ip_address_type                        = ""     # string | optional+computed
    ownership_verification_certificate_arn = ""     # string | optional+computed

    # hosted_zone_id                         = ""     # string | computed
    # target_domain_name                     = ""     # string | computed

  }

  mutual_tls_authentication { # list [0..1]
    truststore_uri     = ""     # string | required
    truststore_version = ""     # string | optional

  }

  timeouts { # single
    create = ""     # string | optional
    update = ""     # string | optional

  }

}

