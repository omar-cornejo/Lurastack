# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_dms_replication_task                            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_dms_replication_task" "this" {

  migration_type            = ""     # string | required
  replication_instance_arn  = ""     # string | required
  replication_task_id       = ""     # string | required
  source_endpoint_arn       = ""     # string | required
  table_mappings            = ""     # string | required
  target_endpoint_arn       = ""     # string | required
  cdc_start_position        = ""     # string | optional+computed
  cdc_start_time            = ""     # string | optional
  id                        = ""     # string | optional+computed
  replication_task_settings = ""     # string | optional+computed
  resource_identifier       = ""     # string | optional
  start_replication_task    = false  # bool | optional
  tags                      = {}     # map(string) | optional
  tags_all                  = {}     # map(string) | optional+computed

  # replication_task_arn      = ""     # string | computed
  # status                    = ""     # string | computed

}

