# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_ecrpublic_authorization_token                       │
# └──────────────────────────────────────────────────────────────┘
data "aws_ecrpublic_authorization_token" "this" {

  id                  = ""     # string | optional+computed

  # authorization_token = ""     # string | computed+sensitive
  # expires_at          = ""     # string | computed
  # password            = ""     # string | computed+sensitive
  # user_name           = ""     # string | computed

}

