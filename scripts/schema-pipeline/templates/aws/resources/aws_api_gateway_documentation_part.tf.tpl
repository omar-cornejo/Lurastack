# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_api_gateway_documentation_part                  │
# └──────────────────────────────────────────────────────────────┘
resource "aws_api_gateway_documentation_part" "this" {

  properties            = ""     # string | required
  rest_api_id           = ""     # string | required
  id                    = ""     # string | optional+computed

  # documentation_part_id = ""     # string | computed

  location { # list [1..1]
    type        = ""     # string | required
    method      = ""     # string | optional
    name        = ""     # string | optional
    path        = ""     # string | optional
    status_code = ""     # string | optional

  }

}

