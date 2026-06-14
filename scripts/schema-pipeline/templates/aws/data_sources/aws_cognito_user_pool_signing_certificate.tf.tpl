# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_cognito_user_pool_signing_certificate               │
# └──────────────────────────────────────────────────────────────┘
data "aws_cognito_user_pool_signing_certificate" "this" {

  user_pool_id = ""     # string | required
  id           = ""     # string | optional+computed

  # certificate  = ""     # string | computed

}

