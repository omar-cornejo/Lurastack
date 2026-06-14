# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_cloudfront_cache_policy                         │
# └──────────────────────────────────────────────────────────────┘
resource "aws_cloudfront_cache_policy" "this" {

  name        = ""     # string | required
  comment     = ""     # string | optional
  default_ttl = 0      # number | optional
  id          = ""     # string | optional+computed
  max_ttl     = 0      # number | optional
  min_ttl     = 0      # number | optional

  # arn         = ""     # string | computed
  # etag        = ""     # string | computed

  parameters_in_cache_key_and_forwarded_to_origin { # list [1..1]
    enable_accept_encoding_brotli = false  # bool | optional
    enable_accept_encoding_gzip   = false  # bool | optional

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

}

