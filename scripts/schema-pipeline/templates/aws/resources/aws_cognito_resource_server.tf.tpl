# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_cognito_resource_server                         │
# └──────────────────────────────────────────────────────────────┘
resource "aws_cognito_resource_server" "this" {

  identifier        = ""     # string | required
  name              = ""     # string | required
  user_pool_id      = ""     # string | required
  id                = ""     # string | optional+computed

  # scope_identifiers = []     # list(string) | computed

  scope { # set [0..100]
    scope_description = ""     # string | required
    scope_name        = ""     # string | required

  }

}

