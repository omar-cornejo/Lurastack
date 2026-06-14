# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_api_gateway_rest_api_put                        │
# └──────────────────────────────────────────────────────────────┘
resource "aws_api_gateway_rest_api_put" "this" {

  body             = ""     # string | required
  rest_api_id      = ""     # string | required
  fail_on_warnings = false  # bool | optional+computed
  parameters       = {}     # map(string) | optional
  triggers         = {}     # map(string) | optional

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}

