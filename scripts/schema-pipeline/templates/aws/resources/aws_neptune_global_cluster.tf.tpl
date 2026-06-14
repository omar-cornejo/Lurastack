# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_neptune_global_cluster                          │
# └──────────────────────────────────────────────────────────────┘
resource "aws_neptune_global_cluster" "this" {

  global_cluster_identifier    = ""     # string | required
  deletion_protection          = false  # bool | optional
  engine                       = ""     # string | optional+computed
  engine_version               = ""     # string | optional+computed
  id                           = ""     # string | optional+computed
  source_db_cluster_identifier = ""     # string | optional+computed
  storage_encrypted            = false  # bool | optional+computed

  # arn                          = ""     # string | computed
  # global_cluster_members = [  # set(object)
  #   {
  #     db_cluster_arn = ""
  #     is_writer = false
  #   }
  # ]
  # global_cluster_resource_id   = ""     # string | computed
  # status                       = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

