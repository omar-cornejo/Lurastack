# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_db_proxy_default_target_group                   │
# └──────────────────────────────────────────────────────────────┘
resource "aws_db_proxy_default_target_group" "this" {

  db_proxy_name = ""     # string | required
  id            = ""     # string | optional+computed

  # arn           = ""     # string | computed
  # name          = ""     # string | computed

  connection_pool_config { # list [0..1]
    connection_borrow_timeout    = 0      # number | optional
    init_query                   = ""     # string | optional
    max_connections_percent      = 0      # number | optional
    max_idle_connections_percent = 0      # number | optional
    session_pinning_filters      = []     # set(string) | optional

  }

  timeouts { # single
    create = ""     # string | optional
    update = ""     # string | optional

  }

}

