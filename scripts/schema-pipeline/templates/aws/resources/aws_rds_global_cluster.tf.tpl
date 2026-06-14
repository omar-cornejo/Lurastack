# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_rds_global_cluster                              │
# └──────────────────────────────────────────────────────────────┘
resource "aws_rds_global_cluster" "this" {

  global_cluster_identifier    = ""     # string | required
  database_name                = ""     # string | optional+computed
  deletion_protection          = false  # bool | optional
  engine                       = ""     # string | optional+computed
  engine_lifecycle_support     = ""     # string | optional+computed
  engine_version               = ""     # string | optional+computed
  force_destroy                = false  # bool | optional
  id                           = ""     # string | optional+computed
  source_db_cluster_identifier = ""     # string | optional+computed
  storage_encrypted            = false  # bool | optional+computed
  tags                         = {}     # map(string) | optional
  tags_all                     = {}     # map(string) | optional+computed

  # arn                          = ""     # string | computed
  # endpoint                     = ""     # string | computed
  # engine_version_actual        = ""     # string | computed
  # global_cluster_members = [  # set(object)
  #   {
  #     db_cluster_arn = ""
  #     is_writer = false
  #   }
  # ]
  # global_cluster_resource_id   = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

