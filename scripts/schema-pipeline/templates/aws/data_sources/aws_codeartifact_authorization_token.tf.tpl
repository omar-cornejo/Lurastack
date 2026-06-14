# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_codeartifact_authorization_token                    │
# └──────────────────────────────────────────────────────────────┘
data "aws_codeartifact_authorization_token" "this" {

  domain              = ""     # string | required
  domain_owner        = ""     # string | optional+computed
  duration_seconds    = 0      # number | optional
  id                  = ""     # string | optional+computed

  # authorization_token = ""     # string | computed
  # expiration          = ""     # string | computed

}

