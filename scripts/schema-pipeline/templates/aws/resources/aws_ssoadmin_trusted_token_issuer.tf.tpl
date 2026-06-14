# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ssoadmin_trusted_token_issuer                   │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ssoadmin_trusted_token_issuer" "this" {

  instance_arn              = ""     # string | required
  name                      = ""     # string | required
  trusted_token_issuer_type = ""     # string | required
  client_token              = ""     # string | optional
  tags                      = {}     # map(string) | optional

  # arn                       = ""     # string | computed
  # id                        = ""     # string | computed
  # tags_all                  = {}     # map(string) | computed

  trusted_token_issuer_configuration { # list

    oidc_jwt_configuration { # list
      claim_attribute_path          = ""     # string | required
      identity_store_attribute_path = ""     # string | required
      issuer_url                    = ""     # string | required
      jwks_retrieval_option         = ""     # string | required

    }

  }

}

