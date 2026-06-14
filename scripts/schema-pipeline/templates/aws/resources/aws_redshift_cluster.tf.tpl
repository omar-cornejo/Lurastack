# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_redshift_cluster                                │
# └──────────────────────────────────────────────────────────────┘
resource "aws_redshift_cluster" "this" {

  cluster_identifier                   = ""     # string | required
  node_type                            = ""     # string | required
  allow_version_upgrade                = false  # bool | optional
  apply_immediately                    = false  # bool | optional
  aqua_configuration_status            = ""     # string | optional+computed+DEPRECATED
  automated_snapshot_retention_period  = 0      # number | optional
  availability_zone                    = ""     # string | optional+computed
  availability_zone_relocation_enabled = false  # bool | optional
  cluster_parameter_group_name         = ""     # string | optional+computed
  cluster_public_key                   = ""     # string | optional+computed
  cluster_revision_number              = ""     # string | optional+computed
  cluster_subnet_group_name            = ""     # string | optional+computed
  cluster_type                         = ""     # string | optional+computed
  cluster_version                      = ""     # string | optional
  database_name                        = ""     # string | optional+computed
  default_iam_role_arn                 = ""     # string | optional+computed
  elastic_ip                           = ""     # string | optional
  encrypted                            = false  # bool | optional
  endpoint                             = ""     # string | optional+computed
  enhanced_vpc_routing                 = false  # bool | optional+computed
  final_snapshot_identifier            = ""     # string | optional
  iam_roles                            = []     # set(string) | optional+computed
  id                                   = ""     # string | optional+computed
  kms_key_id                           = ""     # string | optional+computed
  maintenance_track_name               = ""     # string | optional
  manage_master_password               = false  # bool | optional
  manual_snapshot_retention_period     = 0      # number | optional
  master_password                      = ""     # string | optional+sensitive
  master_password_secret_kms_key_id    = ""     # string | optional+computed
  master_password_wo                   = ""     # string | optional+sensitive+write_only
  master_password_wo_version           = 0      # number | optional
  master_username                      = ""     # string | optional
  multi_az                             = false  # bool | optional
  number_of_nodes                      = 0      # number | optional
  owner_account                        = ""     # string | optional
  port                                 = 0      # number | optional
  preferred_maintenance_window         = ""     # string | optional+computed
  publicly_accessible                  = false  # bool | optional
  skip_final_snapshot                  = false  # bool | optional
  snapshot_arn                         = ""     # string | optional
  snapshot_cluster_identifier          = ""     # string | optional
  snapshot_identifier                  = ""     # string | optional
  tags                                 = {}     # map(string) | optional
  tags_all                             = {}     # map(string) | optional+computed
  vpc_security_group_ids               = []     # set(string) | optional+computed

  # arn                                  = ""     # string | computed
  # cluster_namespace_arn                = ""     # string | computed
  # cluster_nodes = [  # list(object)
  #   {
  #     node_role = ""
  #     private_ip_address = ""
  #     public_ip_address = ""
  #   }
  # ]
  # dns_name                             = ""     # string | computed
  # master_password_secret_arn           = ""     # string | computed

  logging { # list [0..1] DEPRECATED
    enable               = false  # bool | required
    bucket_name          = ""     # string | optional+computed
    log_destination_type = ""     # string | optional
    log_exports          = []     # set(string) | optional
    s3_key_prefix        = ""     # string | optional+computed

  }

  snapshot_copy { # list [0..1] DEPRECATED
    destination_region = ""     # string | required
    grant_name         = ""     # string | optional
    retention_period   = 0      # number | optional

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

