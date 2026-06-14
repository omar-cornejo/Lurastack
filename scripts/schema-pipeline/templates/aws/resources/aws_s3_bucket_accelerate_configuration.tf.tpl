# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_s3_bucket_accelerate_configuration              │
# └──────────────────────────────────────────────────────────────┘
resource "aws_s3_bucket_accelerate_configuration" "this" {

  bucket                = ""     # string | required
  status                = ""     # string | required
  expected_bucket_owner = ""     # string | optional
  id                    = ""     # string | optional+computed

}

