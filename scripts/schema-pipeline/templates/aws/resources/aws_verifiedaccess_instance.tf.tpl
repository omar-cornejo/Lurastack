# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_verifiedaccess_instance                         │
# └──────────────────────────────────────────────────────────────┘
resource "aws_verifiedaccess_instance" "this" {

  cidr_endpoints_custom_subdomain = ""     # string | optional
  description                     = ""     # string | optional
  fips_enabled                    = false  # bool | optional
  id                              = ""     # string | optional+computed
  tags                            = {}     # map(string) | optional
  tags_all                        = {}     # map(string) | optional+computed

  # creation_time                   = ""     # string | computed
  # last_updated_time               = ""     # string | computed
  # name_servers                    = []     # set(string) | computed
  # verified_access_trust_providers = [  # list(object)
  #   {
  #     description = ""
  #     device_trust_provider_type = ""
  #     trust_provider_type = ""
  #     user_trust_provider_type = ""
  #     verified_access_trust_provider_id = ""
  #   }
  # ]

}

