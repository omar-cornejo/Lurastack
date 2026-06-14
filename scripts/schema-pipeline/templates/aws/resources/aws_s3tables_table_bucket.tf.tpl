# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_s3tables_table_bucket                           │
# └──────────────────────────────────────────────────────────────┘
resource "aws_s3tables_table_bucket" "this" {

  name                      = ""     # string | required
  encryption_configuration  = {}     # object({ kms_key_arn: string, sse_algorithm: string }) | optional
  maintenance_configuration = {}     # object({ iceberg_unreferenced_file_removal: object({ settings: object({ non_current_days: number, unreferenced_days: number }), status: string }) }) | optional+computed

  # arn                       = ""     # string | computed
  # created_at                = ""     # string | computed
  # owner_account_id          = ""     # string | computed

}

