# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_dms_replication_task                                │
# └──────────────────────────────────────────────────────────────┘
data "aws_dms_replication_task" "this" {

  replication_task_id       = ""     # string | required
  id                        = ""     # string | optional+computed
  tags                      = {}     # map(string) | optional+computed

  # cdc_start_position        = ""     # string | computed
  # cdc_start_time            = ""     # string | computed
  # migration_type            = ""     # string | computed
  # replication_instance_arn  = ""     # string | computed
  # replication_task_arn      = ""     # string | computed
  # replication_task_settings = ""     # string | computed
  # source_endpoint_arn       = ""     # string | computed
  # start_replication_task    = false  # bool | computed
  # status                    = ""     # string | computed
  # table_mappings            = ""     # string | computed
  # target_endpoint_arn       = ""     # string | computed

}

