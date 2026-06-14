# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_connect_bot_association                         │
# └──────────────────────────────────────────────────────────────┘
resource "aws_connect_bot_association" "this" {

  instance_id = ""     # string | required
  id          = ""     # string | optional+computed

  lex_bot { # list [1..1]
    name       = ""     # string | required
    lex_region = ""     # string | optional+computed

  }

}

