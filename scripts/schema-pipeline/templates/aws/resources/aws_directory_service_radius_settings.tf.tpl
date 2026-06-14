# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_directory_service_radius_settings               │
# └──────────────────────────────────────────────────────────────┘
resource "aws_directory_service_radius_settings" "this" {

  authentication_protocol = ""     # string | required
  directory_id            = ""     # string | required
  display_label           = ""     # string | required
  radius_port             = 0      # number | required
  radius_retries          = 0      # number | required
  radius_servers          = []     # set(string) | required
  radius_timeout          = 0      # number | required
  shared_secret           = ""     # string | required+sensitive
  id                      = ""     # string | optional+computed
  use_same_username       = false  # bool | optional

  timeouts { # single
    create = ""     # string | optional
    update = ""     # string | optional

  }

}

