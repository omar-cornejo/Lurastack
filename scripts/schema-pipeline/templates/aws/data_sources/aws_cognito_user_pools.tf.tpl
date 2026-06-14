# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_cognito_user_pools                                  │
# └──────────────────────────────────────────────────────────────┘
data "aws_cognito_user_pools" "this" {

  name = ""     # string | required
  id   = ""     # string | optional+computed

  # arns = []     # list(string) | computed
  # ids  = []     # list(string) | computed

}

