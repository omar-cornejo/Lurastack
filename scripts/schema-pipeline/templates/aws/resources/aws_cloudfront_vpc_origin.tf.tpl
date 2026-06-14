# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_cloudfront_vpc_origin                           │
# └──────────────────────────────────────────────────────────────┘
resource "aws_cloudfront_vpc_origin" "this" {

  tags     = {}     # map(string) | optional

  # arn      = ""     # string | computed
  # etag     = ""     # string | computed
  # id       = ""     # string | computed
  # tags_all = {}     # map(string) | computed

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    delete = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    update = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

  vpc_origin_endpoint_config { # list
    arn                    = ""     # string | required
    http_port              = 0      # number | required
    https_port             = 0      # number | required
    name                   = ""     # string | required
    origin_protocol_policy = ""     # string | required

    origin_ssl_protocols { # list
      items    = []     # set(string) | required
      quantity = 0      # number | required

    }

  }

}

