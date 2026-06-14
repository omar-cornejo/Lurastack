# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_apprunner_deployment                            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_apprunner_deployment" "this" {

  service_arn  = ""     # string | required

  # id           = ""     # string | computed
  # operation_id = ""     # string | computed
  # status       = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}

