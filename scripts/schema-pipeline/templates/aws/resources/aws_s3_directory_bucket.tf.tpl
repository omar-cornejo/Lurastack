# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_s3_directory_bucket                             │
# └──────────────────────────────────────────────────────────────┘
resource "aws_s3_directory_bucket" "this" {

  bucket          = ""     # string | required
  data_redundancy = ""     # string | optional+computed
  force_destroy   = false  # bool | optional+computed
  type            = ""     # string | optional+computed

  # arn             = ""     # string | computed
  # id              = ""     # string | computed+DEPRECATED

  location { # list
    name = ""     # string | required
    type = ""     # string | optional+computed

  }

}

