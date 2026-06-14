# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_dms_replication_config                          │
# └──────────────────────────────────────────────────────────────┘
resource "aws_dms_replication_config" "this" {

  replication_config_identifier = ""     # string | required
  replication_type              = ""     # string | required
  source_endpoint_arn           = ""     # string | required
  table_mappings                = ""     # string | required
  target_endpoint_arn           = ""     # string | required
  id                            = ""     # string | optional+computed
  replication_settings          = ""     # string | optional+computed
  resource_identifier           = ""     # string | optional+computed
  start_replication             = false  # bool | optional
  supplemental_settings         = ""     # string | optional
  tags                          = {}     # map(string) | optional
  tags_all                      = {}     # map(string) | optional+computed

  # arn                           = ""     # string | computed

  compute_config { # list [1..1]
    replication_subnet_group_id  = ""     # string | required
    availability_zone            = ""     # string | optional+computed
    dns_name_servers             = ""     # string | optional
    kms_key_id                   = ""     # string | optional+computed
    max_capacity_units           = 0      # number | optional
    min_capacity_units           = 0      # number | optional
    multi_az                     = false  # bool | optional+computed
    preferred_maintenance_window = ""     # string | optional+computed
    vpc_security_group_ids       = []     # set(string) | optional+computed

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

