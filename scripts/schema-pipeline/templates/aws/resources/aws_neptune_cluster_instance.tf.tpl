# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_neptune_cluster_instance                        │
# └──────────────────────────────────────────────────────────────┘
resource "aws_neptune_cluster_instance" "this" {

  cluster_identifier           = ""     # string | required
  instance_class               = ""     # string | required
  apply_immediately            = false  # bool | optional+computed
  auto_minor_version_upgrade   = false  # bool | optional
  availability_zone            = ""     # string | optional+computed
  engine                       = ""     # string | optional
  engine_version               = ""     # string | optional+computed
  id                           = ""     # string | optional+computed
  identifier                   = ""     # string | optional+computed
  identifier_prefix            = ""     # string | optional+computed
  neptune_parameter_group_name = ""     # string | optional+computed
  neptune_subnet_group_name    = ""     # string | optional+computed
  port                         = 0      # number | optional
  preferred_backup_window      = ""     # string | optional+computed
  preferred_maintenance_window = ""     # string | optional+computed
  promotion_tier               = 0      # number | optional
  publicly_accessible          = false  # bool | optional
  skip_final_snapshot          = false  # bool | optional
  tags                         = {}     # map(string) | optional
  tags_all                     = {}     # map(string) | optional+computed

  # address                      = ""     # string | computed
  # arn                          = ""     # string | computed
  # dbi_resource_id              = ""     # string | computed
  # endpoint                     = ""     # string | computed
  # kms_key_arn                  = ""     # string | computed
  # storage_encrypted            = false  # bool | computed
  # storage_type                 = ""     # string | computed
  # writer                       = false  # bool | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

