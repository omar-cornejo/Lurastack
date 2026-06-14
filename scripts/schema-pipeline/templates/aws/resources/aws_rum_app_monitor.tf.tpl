# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_rum_app_monitor                                 │
# └──────────────────────────────────────────────────────────────┘
resource "aws_rum_app_monitor" "this" {

  name           = ""     # string | required
  cw_log_enabled = false  # bool | optional
  domain         = ""     # string | optional
  domain_list    = []     # list(string) | optional
  id             = ""     # string | optional+computed
  tags           = {}     # map(string) | optional
  tags_all       = {}     # map(string) | optional+computed

  # app_monitor_id = ""     # string | computed
  # arn            = ""     # string | computed
  # cw_log_group   = ""     # string | computed

  app_monitor_configuration { # list [0..1]
    allow_cookies       = false  # bool | optional
    enable_xray         = false  # bool | optional
    excluded_pages      = []     # set(string) | optional
    favorite_pages      = []     # set(string) | optional
    guest_role_arn      = ""     # string | optional
    identity_pool_id    = ""     # string | optional
    included_pages      = []     # set(string) | optional
    session_sample_rate = 0      # number | optional
    telemetries         = []     # set(string) | optional

  }

  custom_events { # list [0..1]
    status = ""     # string | optional

  }

}

