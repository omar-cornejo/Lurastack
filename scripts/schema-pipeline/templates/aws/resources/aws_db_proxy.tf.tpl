# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_db_proxy                                        │
# └──────────────────────────────────────────────────────────────┘
resource "aws_db_proxy" "this" {

  engine_family          = ""     # string | required
  name                   = ""     # string | required
  role_arn               = ""     # string | required
  vpc_subnet_ids         = []     # set(string) | required
  debug_logging          = false  # bool | optional
  id                     = ""     # string | optional+computed
  idle_client_timeout    = 0      # number | optional+computed
  require_tls            = false  # bool | optional
  tags                   = {}     # map(string) | optional
  tags_all               = {}     # map(string) | optional+computed
  vpc_security_group_ids = []     # set(string) | optional+computed

  # arn                    = ""     # string | computed
  # endpoint               = ""     # string | computed

  auth { # set [1..*]
    auth_scheme               = ""     # string | optional
    client_password_auth_type = ""     # string | optional+computed
    description               = ""     # string | optional
    iam_auth                  = ""     # string | optional
    secret_arn                = ""     # string | optional
    username                  = ""     # string | optional

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

