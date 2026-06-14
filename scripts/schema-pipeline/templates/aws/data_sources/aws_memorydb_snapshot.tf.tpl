# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_memorydb_snapshot                                   │
# └──────────────────────────────────────────────────────────────┘
data "aws_memorydb_snapshot" "this" {

  name                  = ""     # string | required
  id                    = ""     # string | optional+computed
  tags                  = {}     # map(string) | optional+computed

  # arn                   = ""     # string | computed
  # cluster_configuration = [  # list(object)
  #   {
  #     description = ""
  #     engine = ""
  #     engine_version = ""
  #     maintenance_window = ""
  #     name = ""
  #     node_type = ""
  #     num_shards = 0
  #     parameter_group_name = ""
  #     port = 0
  #     snapshot_retention_limit = 0
  #     snapshot_window = ""
  #     subnet_group_name = ""
  #     topic_arn = ""
  #     vpc_id = ""
  #   }
  # ]
  # cluster_name          = ""     # string | computed
  # kms_key_arn           = ""     # string | computed
  # source                = ""     # string | computed

}

