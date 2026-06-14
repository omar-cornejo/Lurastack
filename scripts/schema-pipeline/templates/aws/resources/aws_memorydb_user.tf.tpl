# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_memorydb_user                                   │
# └──────────────────────────────────────────────────────────────┘
resource "aws_memorydb_user" "this" {

  access_string          = ""     # string | required
  user_name              = ""     # string | required
  id                     = ""     # string | optional+computed
  tags                   = {}     # map(string) | optional
  tags_all               = {}     # map(string) | optional+computed

  # arn                    = ""     # string | computed
  # minimum_engine_version = ""     # string | computed

  authentication_mode { # list [1..1]
    type           = ""     # string | required
    passwords      = []     # set(string) | optional+sensitive

    # password_count = 0      # number | computed

  }

}

