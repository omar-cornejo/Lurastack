# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_s3_bucket_metric                                │
# └──────────────────────────────────────────────────────────────┘
resource "aws_s3_bucket_metric" "this" {

  bucket = ""     # string | required
  name   = ""     # string | required
  id     = ""     # string | optional+computed

  filter { # list [0..1]
    access_point = ""     # string | optional
    prefix       = ""     # string | optional
    tags         = {}     # map(string) | optional

  }

}

