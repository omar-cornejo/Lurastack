# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_s3_bucket_policy                                    │
# └──────────────────────────────────────────────────────────────┘
data "aws_s3_bucket_policy" "this" {

  bucket = ""     # string | required
  id     = ""     # string | optional+computed

  # policy = ""     # string | computed

}

