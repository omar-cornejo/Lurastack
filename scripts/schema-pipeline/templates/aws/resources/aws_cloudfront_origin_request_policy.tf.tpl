# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_cloudfront_origin_request_policy                │
# └──────────────────────────────────────────────────────────────┘
resource "aws_cloudfront_origin_request_policy" "this" {

  name    = ""     # string | required
  comment = ""     # string | optional
  id      = ""     # string | optional+computed

  # arn     = ""     # string | computed
  # etag    = ""     # string | computed

  cookies_config { # list [1..1]
    cookie_behavior = ""     # string | required

    cookies { # list [0..1]
      items = []     # set(string) | optional

    }

  }

  headers_config { # list [1..1]
    header_behavior = ""     # string | optional

    headers { # list [0..1]
      items = []     # set(string) | optional

    }

  }

  query_strings_config { # list [1..1]
    query_string_behavior = ""     # string | required

    query_strings { # list [0..1]
      items = []     # set(string) | optional

    }

  }

}

