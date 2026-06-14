# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_s3tables_namespace                              │
# └──────────────────────────────────────────────────────────────┘
resource "aws_s3tables_namespace" "this" {

  namespace        = ""     # string | required
  table_bucket_arn = ""     # string | required

  # created_at       = ""     # string | computed
  # created_by       = ""     # string | computed
  # owner_account_id = ""     # string | computed

}

