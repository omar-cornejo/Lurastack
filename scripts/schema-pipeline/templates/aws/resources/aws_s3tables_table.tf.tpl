# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_s3tables_table                                  │
# └──────────────────────────────────────────────────────────────┘
resource "aws_s3tables_table" "this" {

  format                    = ""     # string | required
  name                      = ""     # string | required
  namespace                 = ""     # string | required
  table_bucket_arn          = ""     # string | required
  encryption_configuration  = {}     # object({ kms_key_arn: string, sse_algorithm: string }) | optional+computed
  maintenance_configuration = {}     # object({ iceberg_compaction: object({ settings: object({ target_file_size_mb: number }), status: string }), iceberg_snapshot_management: object({ settings: object({ max_snapshot_age_hours: number, min_snapshots_to_keep: number }), status: string }) }) | optional+computed

  # arn                       = ""     # string | computed
  # created_at                = ""     # string | computed
  # created_by                = ""     # string | computed
  # metadata_location         = ""     # string | computed
  # modified_at               = ""     # string | computed
  # modified_by               = ""     # string | computed
  # owner_account_id          = ""     # string | computed
  # type                      = ""     # string | computed
  # version_token             = ""     # string | computed
  # warehouse_location        = ""     # string | computed

}

