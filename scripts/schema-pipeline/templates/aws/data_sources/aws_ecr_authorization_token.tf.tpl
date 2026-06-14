# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_ecr_authorization_token                             │
# └──────────────────────────────────────────────────────────────┘
data "aws_ecr_authorization_token" "this" {

  id                  = ""     # string | optional+computed
  registry_id         = ""     # string | optional

  # authorization_token = ""     # string | computed+sensitive
  # expires_at          = ""     # string | computed
  # password            = ""     # string | computed+sensitive
  # proxy_endpoint      = ""     # string | computed
  # user_name           = ""     # string | computed

}

