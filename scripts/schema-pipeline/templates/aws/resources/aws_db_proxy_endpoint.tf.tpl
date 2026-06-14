# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_db_proxy_endpoint                               │
# └──────────────────────────────────────────────────────────────┘
resource "aws_db_proxy_endpoint" "this" {

  db_proxy_endpoint_name = ""     # string | required
  db_proxy_name          = ""     # string | required
  vpc_subnet_ids         = []     # set(string) | required
  id                     = ""     # string | optional+computed
  tags                   = {}     # map(string) | optional
  tags_all               = {}     # map(string) | optional+computed
  target_role            = ""     # string | optional
  vpc_security_group_ids = []     # set(string) | optional+computed

  # arn                    = ""     # string | computed
  # endpoint               = ""     # string | computed
  # is_default             = false  # bool | computed
  # vpc_id                 = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

