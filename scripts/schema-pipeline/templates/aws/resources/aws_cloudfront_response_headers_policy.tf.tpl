# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_cloudfront_response_headers_policy              │
# └──────────────────────────────────────────────────────────────┘
resource "aws_cloudfront_response_headers_policy" "this" {

  name    = ""     # string | required
  comment = ""     # string | optional
  etag    = ""     # string | optional+computed
  id      = ""     # string | optional+computed

  # arn     = ""     # string | computed

  cors_config { # list [0..1]
    access_control_allow_credentials = false  # bool | required
    origin_override                  = false  # bool | required
    access_control_max_age_sec       = 0      # number | optional

    access_control_allow_headers { # list [1..1]
      items = []     # set(string) | optional

    }

    access_control_allow_methods { # list [1..1]
      items = []     # set(string) | optional

    }

    access_control_allow_origins { # list [1..1]
      items = []     # set(string) | optional

    }

    access_control_expose_headers { # list [0..1]
      items = []     # set(string) | optional

    }

  }

  custom_headers_config { # list [0..1]

    items { # set
      header   = ""     # string | required
      override = false  # bool | required
      value    = ""     # string | required

    }

  }

  remove_headers_config { # list [0..1]

    items { # set
      header = ""     # string | required

    }

  }

  security_headers_config { # list [0..1]

    content_security_policy { # list [0..1]
      content_security_policy = ""     # string | required
      override                = false  # bool | required

    }

    content_type_options { # list [0..1]
      override = false  # bool | required

    }

    frame_options { # list [0..1]
      frame_option = ""     # string | required
      override     = false  # bool | required

    }

    referrer_policy { # list [0..1]
      override        = false  # bool | required
      referrer_policy = ""     # string | required

    }

    strict_transport_security { # list [0..1]
      access_control_max_age_sec = 0      # number | required
      override                   = false  # bool | required
      include_subdomains         = false  # bool | optional
      preload                    = false  # bool | optional

    }

    xss_protection { # list [0..1]
      override   = false  # bool | required
      protection = false  # bool | required
      mode_block = false  # bool | optional
      report_uri = ""     # string | optional

    }

  }

  server_timing_headers_config { # list [0..1]
    enabled       = false  # bool | required
    sampling_rate = 0      # number | required

  }

}

