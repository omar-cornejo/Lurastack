# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_api_gateway_usage_plan                          │
# └──────────────────────────────────────────────────────────────┘
resource "aws_api_gateway_usage_plan" "this" {

  name         = ""     # string | required
  description  = ""     # string | optional
  id           = ""     # string | optional+computed
  product_code = ""     # string | optional
  tags         = {}     # map(string) | optional
  tags_all     = {}     # map(string) | optional+computed

  # arn          = ""     # string | computed

  api_stages { # set
    api_id = ""     # string | required
    stage  = ""     # string | required

    throttle { # set
      path        = ""     # string | required
      burst_limit = 0      # number | optional
      rate_limit  = 0      # number | optional

    }

  }

  quota_settings { # list [0..1]
    limit  = 0      # number | required
    period = ""     # string | required
    offset = 0      # number | optional

  }

  throttle_settings { # list [0..1]
    burst_limit = 0      # number | optional
    rate_limit  = 0      # number | optional

  }

}

