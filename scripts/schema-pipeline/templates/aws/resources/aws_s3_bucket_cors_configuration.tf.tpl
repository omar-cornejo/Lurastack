# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_s3_bucket_cors_configuration                    │
# └──────────────────────────────────────────────────────────────┘
resource "aws_s3_bucket_cors_configuration" "this" {

  bucket                = ""     # string | required
  expected_bucket_owner = ""     # string | optional
  id                    = ""     # string | optional+computed

  cors_rule { # set [1..100]
    allowed_methods = []     # set(string) | required
    allowed_origins = []     # set(string) | required
    allowed_headers = []     # set(string) | optional
    expose_headers  = []     # set(string) | optional
    id              = ""     # string | optional
    max_age_seconds = 0      # number | optional

  }

}

