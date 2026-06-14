# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_rds_cluster_activity_stream                     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_rds_cluster_activity_stream" "this" {

  kms_key_id                          = ""     # string | required
  mode                                = ""     # string | required
  resource_arn                        = ""     # string | required
  engine_native_audit_fields_included = false  # bool | optional
  id                                  = ""     # string | optional+computed

  # kinesis_stream_name                 = ""     # string | computed

}

