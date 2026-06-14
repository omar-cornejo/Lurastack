# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_s3_access_point                                 │
# └──────────────────────────────────────────────────────────────┘
resource "aws_s3_access_point" "this" {

  bucket                   = ""     # string | required
  name                     = ""     # string | required
  account_id               = ""     # string | optional+computed
  bucket_account_id        = ""     # string | optional+computed
  id                       = ""     # string | optional+computed
  policy                   = ""     # string | optional+computed

  # alias                    = ""     # string | computed
  # arn                      = ""     # string | computed
  # domain_name              = ""     # string | computed
  # endpoints                = {}     # map(string) | computed
  # has_public_access_policy = false  # bool | computed
  # network_origin           = ""     # string | computed

  public_access_block_configuration { # list [0..1]
    block_public_acls       = false  # bool | optional
    block_public_policy     = false  # bool | optional
    ignore_public_acls      = false  # bool | optional
    restrict_public_buckets = false  # bool | optional

  }

  vpc_configuration { # list [0..1]
    vpc_id = ""     # string | required

  }

}

