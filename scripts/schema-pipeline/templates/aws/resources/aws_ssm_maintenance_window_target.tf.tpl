# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ssm_maintenance_window_target                   │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ssm_maintenance_window_target" "this" {

  resource_type     = ""     # string | required
  window_id         = ""     # string | required
  description       = ""     # string | optional
  id                = ""     # string | optional+computed
  name              = ""     # string | optional
  owner_information = ""     # string | optional

  targets { # list [1..5]
    key    = ""     # string | required
    values = []     # list(string) | required

  }

}

