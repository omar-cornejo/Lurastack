# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_redshift_cluster                                    │
# └──────────────────────────────────────────────────────────────┘
data "aws_redshift_cluster" "this" {

  cluster_identifier                   = ""     # string | required
  id                                   = ""     # string | optional+computed
  tags                                 = {}     # map(string) | optional+computed

  # allow_version_upgrade                = false  # bool | computed
  # aqua_configuration_status            = ""     # string | computed
  # arn                                  = ""     # string | computed
  # automated_snapshot_retention_period  = 0      # number | computed
  # availability_zone                    = ""     # string | computed
  # availability_zone_relocation_enabled = false  # bool | computed
  # bucket_name                          = ""     # string | computed
  # cluster_namespace_arn                = ""     # string | computed
  # cluster_nodes = [  # list(object)
  #   {
  #     node_role = ""
  #     private_ip_address = ""
  #     public_ip_address = ""
  #   }
  # ]
  # cluster_parameter_group_name         = ""     # string | computed
  # cluster_public_key                   = ""     # string | computed
  # cluster_revision_number              = ""     # string | computed
  # cluster_subnet_group_name            = ""     # string | computed
  # cluster_type                         = ""     # string | computed
  # cluster_version                      = ""     # string | computed
  # database_name                        = ""     # string | computed
  # default_iam_role_arn                 = ""     # string | computed
  # elastic_ip                           = ""     # string | computed
  # enable_logging                       = false  # bool | computed
  # encrypted                            = false  # bool | computed
  # endpoint                             = ""     # string | computed
  # enhanced_vpc_routing                 = false  # bool | computed
  # iam_roles                            = []     # list(string) | computed
  # kms_key_id                           = ""     # string | computed
  # log_destination_type                 = ""     # string | computed
  # log_exports                          = []     # set(string) | computed
  # maintenance_track_name               = ""     # string | computed
  # manual_snapshot_retention_period     = 0      # number | computed
  # master_username                      = ""     # string | computed
  # multi_az                             = false  # bool | computed
  # node_type                            = ""     # string | computed
  # number_of_nodes                      = 0      # number | computed
  # port                                 = 0      # number | computed
  # preferred_maintenance_window         = ""     # string | computed
  # publicly_accessible                  = false  # bool | computed
  # s3_key_prefix                        = ""     # string | computed
  # vpc_id                               = ""     # string | computed
  # vpc_security_group_ids               = []     # list(string) | computed

}

