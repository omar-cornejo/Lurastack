# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_s3_bucket_policy                                │
# └──────────────────────────────────────────────────────────────┘
resource "aws_s3_bucket_policy" "this" {

  bucket = ""     # string | required
  policy = ""     # string | required
  id     = ""     # string | optional+computed

}

