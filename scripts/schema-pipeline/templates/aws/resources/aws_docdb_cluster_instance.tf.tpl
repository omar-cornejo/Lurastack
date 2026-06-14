# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_docdb_cluster_instance                          │
# └──────────────────────────────────────────────────────────────┘
resource "aws_docdb_cluster_instance" "this" {

  cluster_identifier              = ""     # string | required
  instance_class                  = ""     # string | required
  apply_immediately               = false  # bool | optional
  auto_minor_version_upgrade      = false  # bool | optional
  availability_zone               = ""     # string | optional+computed
  ca_cert_identifier              = ""     # string | optional+computed
  copy_tags_to_snapshot           = false  # bool | optional
  enable_performance_insights     = false  # bool | optional
  engine                          = ""     # string | optional
  id                              = ""     # string | optional+computed
  identifier                      = ""     # string | optional+computed
  identifier_prefix               = ""     # string | optional+computed
  performance_insights_kms_key_id = ""     # string | optional+computed
  preferred_maintenance_window    = ""     # string | optional+computed
  promotion_tier                  = 0      # number | optional
  tags                            = {}     # map(string) | optional
  tags_all                        = {}     # map(string) | optional+computed

  # arn                             = ""     # string | computed
  # db_subnet_group_name            = ""     # string | computed
  # dbi_resource_id                 = ""     # string | computed
  # endpoint                        = ""     # string | computed
  # engine_version                  = ""     # string | computed
  # kms_key_id                      = ""     # string | computed
  # port                            = 0      # number | computed
  # preferred_backup_window         = ""     # string | computed
  # publicly_accessible             = false  # bool | computed
  # storage_encrypted               = false  # bool | computed
  # writer                          = false  # bool | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

