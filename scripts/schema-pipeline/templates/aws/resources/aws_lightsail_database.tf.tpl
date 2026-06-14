# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_lightsail_database                              │
# └──────────────────────────────────────────────────────────────┘
resource "aws_lightsail_database" "this" {

  blueprint_id                 = ""     # string | required
  bundle_id                    = ""     # string | required
  master_database_name         = ""     # string | required
  master_password              = ""     # string | required+sensitive
  master_username              = ""     # string | required
  relational_database_name     = ""     # string | required
  apply_immediately            = false  # bool | optional+computed
  availability_zone            = ""     # string | optional+computed
  backup_retention_enabled     = false  # bool | optional
  final_snapshot_name          = ""     # string | optional
  id                           = ""     # string | optional+computed
  preferred_backup_window      = ""     # string | optional+computed
  preferred_maintenance_window = ""     # string | optional+computed
  publicly_accessible          = false  # bool | optional
  skip_final_snapshot          = false  # bool | optional
  tags                         = {}     # map(string) | optional
  tags_all                     = {}     # map(string) | optional+computed

  # arn                          = ""     # string | computed
  # ca_certificate_identifier    = ""     # string | computed
  # cpu_count                    = 0      # number | computed
  # created_at                   = ""     # string | computed
  # disk_size                    = 0      # number | computed
  # engine                       = ""     # string | computed
  # engine_version               = ""     # string | computed
  # master_endpoint_address      = ""     # string | computed
  # master_endpoint_port         = 0      # number | computed
  # ram_size                     = 0      # number | computed
  # secondary_availability_zone  = ""     # string | computed
  # support_code                 = ""     # string | computed

}

