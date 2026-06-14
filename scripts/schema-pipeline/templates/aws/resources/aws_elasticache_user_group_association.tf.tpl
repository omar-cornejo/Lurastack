# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_elasticache_user_group_association              │
# └──────────────────────────────────────────────────────────────┘
resource "aws_elasticache_user_group_association" "this" {

  user_group_id = ""     # string | required
  user_id       = ""     # string | required
  id            = ""     # string | optional+computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

