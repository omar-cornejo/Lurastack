# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_memorydb_snapshot                               │
# └──────────────────────────────────────────────────────────────┘
resource "aws_memorydb_snapshot" "this" {

  cluster_name          = ""     # string | required
  id                    = ""     # string | optional+computed
  kms_key_arn           = ""     # string | optional
  name                  = ""     # string | optional+computed
  name_prefix           = ""     # string | optional+computed
  tags                  = {}     # map(string) | optional
  tags_all              = {}     # map(string) | optional+computed

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
  # source                = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

