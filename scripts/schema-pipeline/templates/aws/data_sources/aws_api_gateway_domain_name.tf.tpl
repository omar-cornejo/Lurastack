# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_api_gateway_domain_name                             │
# └──────────────────────────────────────────────────────────────┘
data "aws_api_gateway_domain_name" "this" {

  domain_name               = ""     # string | required
  domain_name_id            = ""     # string | optional+computed
  id                        = ""     # string | optional+computed
  tags                      = {}     # map(string) | optional+computed

  # arn                       = ""     # string | computed
  # certificate_arn           = ""     # string | computed
  # certificate_name          = ""     # string | computed
  # certificate_upload_date   = ""     # string | computed
  # cloudfront_domain_name    = ""     # string | computed
  # cloudfront_zone_id        = ""     # string | computed
  # endpoint_configuration = [  # list(object)
  #   {
  #     ip_address_type = ""
  #     types = []  # list(string)
  #   }
  # ]
  # policy                    = ""     # string | computed
  # regional_certificate_arn  = ""     # string | computed
  # regional_certificate_name = ""     # string | computed
  # regional_domain_name      = ""     # string | computed
  # regional_zone_id          = ""     # string | computed
  # security_policy           = ""     # string | computed

}

