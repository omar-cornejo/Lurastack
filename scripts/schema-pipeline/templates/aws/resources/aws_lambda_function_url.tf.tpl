# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_lambda_function_url                             │
# └──────────────────────────────────────────────────────────────┘
resource "aws_lambda_function_url" "this" {

  authorization_type = ""     # string | required
  function_name      = ""     # string | required
  id                 = ""     # string | optional+computed
  invoke_mode        = ""     # string | optional
  qualifier          = ""     # string | optional

  # function_arn       = ""     # string | computed
  # function_url       = ""     # string | computed
  # url_id             = ""     # string | computed

  cors { # list [0..1]
    allow_credentials = false  # bool | optional
    allow_headers     = []     # set(string) | optional
    allow_methods     = []     # set(string) | optional
    allow_origins     = []     # set(string) | optional
    expose_headers    = []     # set(string) | optional
    max_age           = 0      # number | optional

  }

  timeouts { # single
    create = ""     # string | optional

  }

}

