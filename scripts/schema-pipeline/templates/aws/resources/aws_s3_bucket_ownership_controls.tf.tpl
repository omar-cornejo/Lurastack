# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_s3_bucket_ownership_controls                    │
# └──────────────────────────────────────────────────────────────┘
resource "aws_s3_bucket_ownership_controls" "this" {

  bucket = ""     # string | required
  id     = ""     # string | optional+computed

  rule { # list [1..1]
    object_ownership = ""     # string | required

  }

}

