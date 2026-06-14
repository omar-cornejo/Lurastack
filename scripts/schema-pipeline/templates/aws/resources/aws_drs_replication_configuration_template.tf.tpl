# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_drs_replication_configuration_template          │
# └──────────────────────────────────────────────────────────────┘
resource "aws_drs_replication_configuration_template" "this" {

  associate_default_security_group        = false  # bool | required
  bandwidth_throttling                    = 0      # number | required
  create_public_ip                        = false  # bool | required
  data_plane_routing                      = ""     # string | required
  default_large_staging_disk_type         = ""     # string | required
  ebs_encryption                          = ""     # string | required
  replication_server_instance_type        = ""     # string | required
  replication_servers_security_groups_ids = []     # list(string) | required
  staging_area_subnet_id                  = ""     # string | required
  staging_area_tags                       = {}     # map(string) | required
  use_dedicated_replication_server        = false  # bool | required
  auto_replicate_new_disks                = false  # bool | optional+computed
  ebs_encryption_key_arn                  = ""     # string | optional
  tags                                    = {}     # map(string) | optional

  # arn                                     = ""     # string | computed
  # id                                      = ""     # string | computed
  # tags_all                                = {}     # map(string) | computed

  pit_policy { # list
    interval           = 0      # number | required
    retention_duration = 0      # number | required
    units              = ""     # string | required
    enabled            = false  # bool | optional
    rule_id            = 0      # number | optional

  }

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    delete = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    update = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}

