# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_s3_bucket_versioning                            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_s3_bucket_versioning" "this" {

  bucket                = ""     # string | required
  expected_bucket_owner = ""     # string | optional
  id                    = ""     # string | optional+computed
  mfa                   = ""     # string | optional

  versioning_configuration { # list [1..1]
    status     = ""     # string | required
    mfa_delete = ""     # string | optional+computed

  }

}

