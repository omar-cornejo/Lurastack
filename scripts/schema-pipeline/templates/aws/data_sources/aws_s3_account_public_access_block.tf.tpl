# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_s3_account_public_access_block                      │
# └──────────────────────────────────────────────────────────────┘
data "aws_s3_account_public_access_block" "this" {

  account_id              = ""     # string | optional
  id                      = ""     # string | optional+computed

  # block_public_acls       = false  # bool | computed
  # block_public_policy     = false  # bool | computed
  # ignore_public_acls      = false  # bool | computed
  # restrict_public_buckets = false  # bool | computed

}

