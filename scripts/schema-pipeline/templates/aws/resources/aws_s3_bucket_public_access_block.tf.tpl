# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_s3_bucket_public_access_block                   │
# └──────────────────────────────────────────────────────────────┘
resource "aws_s3_bucket_public_access_block" "this" {

  bucket                  = ""     # string | required
  block_public_acls       = false  # bool | optional
  block_public_policy     = false  # bool | optional
  id                      = ""     # string | optional+computed
  ignore_public_acls      = false  # bool | optional
  restrict_public_buckets = false  # bool | optional

}

