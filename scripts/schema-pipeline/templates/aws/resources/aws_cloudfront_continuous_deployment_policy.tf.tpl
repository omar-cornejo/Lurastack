# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_cloudfront_continuous_deployment_policy         │
# └──────────────────────────────────────────────────────────────┘
resource "aws_cloudfront_continuous_deployment_policy" "this" {

  enabled            = false  # bool | required

  # arn                = ""     # string | computed
  # etag               = ""     # string | computed
  # id                 = ""     # string | computed
  # last_modified_time = ""     # string | computed

  staging_distribution_dns_names { # list
    quantity = 0      # number | required
    items    = []     # set(string) | optional

  }

  traffic_config { # list
    type = ""     # string | required

    single_header_config { # list
      header = ""     # string | required
      value  = ""     # string | required

    }

    single_weight_config { # list
      weight = 0      # number | required

      session_stickiness_config { # list
        idle_ttl    = 0      # number | required
        maximum_ttl = 0      # number | required

      }

    }

  }

}

