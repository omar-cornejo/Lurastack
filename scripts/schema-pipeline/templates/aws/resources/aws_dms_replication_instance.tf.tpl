# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_dms_replication_instance                        │
# └──────────────────────────────────────────────────────────────┘
resource "aws_dms_replication_instance" "this" {

  replication_instance_class       = ""     # string | required
  replication_instance_id          = ""     # string | required
  allocated_storage                = 0      # number | optional+computed
  allow_major_version_upgrade      = false  # bool | optional
  apply_immediately                = false  # bool | optional
  auto_minor_version_upgrade       = false  # bool | optional+computed
  availability_zone                = ""     # string | optional+computed
  engine_version                   = ""     # string | optional+computed
  id                               = ""     # string | optional+computed
  kms_key_arn                      = ""     # string | optional+computed
  multi_az                         = false  # bool | optional+computed
  network_type                     = ""     # string | optional+computed
  preferred_maintenance_window     = ""     # string | optional+computed
  publicly_accessible              = false  # bool | optional+computed
  replication_subnet_group_id      = ""     # string | optional+computed
  tags                             = {}     # map(string) | optional
  tags_all                         = {}     # map(string) | optional+computed
  vpc_security_group_ids           = []     # set(string) | optional+computed

  # replication_instance_arn         = ""     # string | computed
  # replication_instance_private_ips = []     # list(string) | computed
  # replication_instance_public_ips  = []     # list(string) | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

