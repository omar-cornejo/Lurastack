# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_cloudfront_field_level_encryption_config        │
# └──────────────────────────────────────────────────────────────┘
resource "aws_cloudfront_field_level_encryption_config" "this" {

  comment          = ""     # string | optional
  id               = ""     # string | optional+computed

  # arn              = ""     # string | computed
  # caller_reference = ""     # string | computed
  # etag             = ""     # string | computed

  content_type_profile_config { # list [1..1]
    forward_when_content_type_is_unknown = false  # bool | required

    content_type_profiles { # list [1..1]

      items { # set [1..*]
        content_type = ""     # string | required
        format       = ""     # string | required
        profile_id   = ""     # string | optional

      }

    }

  }

  query_arg_profile_config { # list [1..1]
    forward_when_query_arg_profile_is_unknown = false  # bool | required

    query_arg_profiles { # list [0..1]

      items { # set
        profile_id = ""     # string | required
        query_arg  = ""     # string | required

      }

    }

  }

}

