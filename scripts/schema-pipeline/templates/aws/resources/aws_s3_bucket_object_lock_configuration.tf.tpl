# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_s3_bucket_object_lock_configuration             │
# └──────────────────────────────────────────────────────────────┘
resource "aws_s3_bucket_object_lock_configuration" "this" {

  bucket                = ""     # string | required
  expected_bucket_owner = ""     # string | optional
  id                    = ""     # string | optional+computed
  object_lock_enabled   = ""     # string | optional
  token                 = ""     # string | optional+sensitive

  rule { # list [0..1]

    default_retention { # list [1..1]
      days  = 0      # number | optional
      mode  = ""     # string | optional
      years = 0      # number | optional

    }

  }

}

