# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_cloudfront_field_level_encryption_profile       │
# └──────────────────────────────────────────────────────────────┘
resource "aws_cloudfront_field_level_encryption_profile" "this" {

  name             = ""     # string | required
  comment          = ""     # string | optional
  id               = ""     # string | optional+computed

  # arn              = ""     # string | computed
  # caller_reference = ""     # string | computed
  # etag             = ""     # string | computed

  encryption_entities { # list [1..1]

    items { # set
      provider_id   = ""     # string | required
      public_key_id = ""     # string | required

      field_patterns { # list [1..1]
        items = []     # set(string) | optional

      }

    }

  }

}

