# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_network_interface_permission                    │
# └──────────────────────────────────────────────────────────────┘
resource "aws_network_interface_permission" "this" {

  aws_account_id                  = ""     # string | required
  network_interface_id            = ""     # string | required
  permission                      = ""     # string | required

  # network_interface_permission_id = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    delete = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}

