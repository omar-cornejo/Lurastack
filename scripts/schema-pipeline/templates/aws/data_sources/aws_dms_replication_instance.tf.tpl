# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_dms_replication_instance                            │
# └──────────────────────────────────────────────────────────────┘
data "aws_dms_replication_instance" "this" {

  replication_instance_id          = ""     # string | required
  id                               = ""     # string | optional+computed
  tags                             = {}     # map(string) | optional+computed

  # allocated_storage                = 0      # number | computed
  # auto_minor_version_upgrade       = false  # bool | computed
  # availability_zone                = ""     # string | computed
  # engine_version                   = ""     # string | computed
  # kms_key_arn                      = ""     # string | computed
  # multi_az                         = false  # bool | computed
  # network_type                     = ""     # string | computed
  # preferred_maintenance_window     = ""     # string | computed
  # publicly_accessible              = false  # bool | computed
  # replication_instance_arn         = ""     # string | computed
  # replication_instance_class       = ""     # string | computed
  # replication_instance_private_ips = []     # list(string) | computed
  # replication_instance_public_ips  = []     # list(string) | computed
  # replication_subnet_group_id      = ""     # string | computed
  # vpc_security_group_ids           = []     # set(string) | computed

}

