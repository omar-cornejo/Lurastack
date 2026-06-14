# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_elasticache_user                                    │
# └──────────────────────────────────────────────────────────────┘
data "aws_elasticache_user" "this" {

  user_id              = ""     # string | required
  access_string        = ""     # string | optional
  engine               = ""     # string | optional
  id                   = ""     # string | optional+computed
  no_password_required = false  # bool | optional
  passwords            = []     # set(string) | optional+sensitive
  user_name            = ""     # string | optional

  authentication_mode { # list
    password_count = 0      # number | optional
    type           = ""     # string | optional

  }

}

