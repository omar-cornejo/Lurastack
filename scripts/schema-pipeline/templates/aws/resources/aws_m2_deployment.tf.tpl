# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_m2_deployment                                   │
# └──────────────────────────────────────────────────────────────┘
resource "aws_m2_deployment" "this" {

  application_id      = ""     # string | required
  application_version = 0      # number | required
  environment_id      = ""     # string | required
  start               = false  # bool | required
  force_stop          = false  # bool | optional

  # deployment_id       = ""     # string | computed
  # id                  = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    delete = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    update = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}

