# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_s3_bucket_intelligent_tiering_configuration     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_s3_bucket_intelligent_tiering_configuration" "this" {

  bucket = ""     # string | required
  name   = ""     # string | required
  id     = ""     # string | optional+computed
  status = ""     # string | optional

  filter { # list [0..1]
    prefix = ""     # string | optional
    tags   = {}     # map(string) | optional

  }

  tiering { # set [1..*]
    access_tier = ""     # string | required
    days        = 0      # number | required

  }

}

