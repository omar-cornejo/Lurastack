# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_cognito_user_pool_clients                           │
# └──────────────────────────────────────────────────────────────┘
data "aws_cognito_user_pool_clients" "this" {

  user_pool_id = ""     # string | required
  id           = ""     # string | optional+computed

  # client_ids   = []     # list(string) | computed
  # client_names = []     # list(string) | computed

}

