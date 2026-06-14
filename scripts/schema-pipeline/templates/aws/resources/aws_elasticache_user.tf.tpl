# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_elasticache_user                                │
# └──────────────────────────────────────────────────────────────┘
resource "aws_elasticache_user" "this" {

  access_string        = ""     # string | required
  engine               = ""     # string | required
  user_id              = ""     # string | required
  user_name            = ""     # string | required
  id                   = ""     # string | optional+computed
  no_password_required = false  # bool | optional
  passwords            = []     # set(string) | optional+sensitive
  tags                 = {}     # map(string) | optional
  tags_all             = {}     # map(string) | optional+computed

  # arn                  = ""     # string | computed

  authentication_mode { # list [0..1]
    type           = ""     # string | required
    passwords      = []     # set(string) | optional+sensitive

    # password_count = 0      # number | computed

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    read   = ""     # string | optional
    update = ""     # string | optional

  }

}

