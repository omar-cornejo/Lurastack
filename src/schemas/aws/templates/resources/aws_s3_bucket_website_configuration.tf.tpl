# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_s3_bucket_website_configuration                 │
# └──────────────────────────────────────────────────────────────┘
resource "aws_s3_bucket_website_configuration" "this" {

  bucket                = ""     # string | required
  expected_bucket_owner = ""     # string | optional
  id                    = ""     # string | optional+computed
  routing_rules         = ""     # string | optional+computed

  # website_domain        = ""     # string | computed
  # website_endpoint      = ""     # string | computed

  error_document { # list [0..1]
    key = ""     # string | required

  }

  index_document { # list [0..1]
    suffix = ""     # string | required

  }

  redirect_all_requests_to { # list [0..1]
    host_name = ""     # string | required
    protocol  = ""     # string | optional

  }

  routing_rule { # list

    condition { # list [0..1]
      http_error_code_returned_equals = ""     # string | optional
      key_prefix_equals               = ""     # string | optional

    }

    redirect { # list [1..1]
      host_name               = ""     # string | optional
      http_redirect_code      = ""     # string | optional
      protocol                = ""     # string | optional
      replace_key_prefix_with = ""     # string | optional
      replace_key_with        = ""     # string | optional

    }

  }

}

