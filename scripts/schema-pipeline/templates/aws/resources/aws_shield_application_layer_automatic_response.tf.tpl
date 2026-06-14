# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_shield_application_layer_automatic_response     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_shield_application_layer_automatic_response" "this" {

  action       = ""     # string | required
  resource_arn = ""     # string | required

  # id           = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    delete = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    update = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}

