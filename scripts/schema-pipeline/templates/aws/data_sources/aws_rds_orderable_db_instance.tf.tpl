# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_rds_orderable_db_instance                           │
# └──────────────────────────────────────────────────────────────┘
data "aws_rds_orderable_db_instance" "this" {

  engine                               = ""     # string | required
  availability_zone_group              = ""     # string | optional+computed
  engine_latest_version                = false  # bool | optional
  engine_version                       = ""     # string | optional+computed
  id                                   = ""     # string | optional+computed
  instance_class                       = ""     # string | optional+computed
  license_model                        = ""     # string | optional+computed
  preferred_engine_versions            = []     # list(string) | optional
  preferred_instance_classes           = []     # list(string) | optional
  read_replica_capable                 = false  # bool | optional+computed
  storage_type                         = ""     # string | optional+computed
  supported_engine_modes               = []     # list(string) | optional+computed
  supported_network_types              = []     # list(string) | optional+computed
  supports_clusters                    = false  # bool | optional+computed
  supports_enhanced_monitoring         = false  # bool | optional+computed
  supports_global_databases            = false  # bool | optional+computed
  supports_iam_database_authentication = false  # bool | optional+computed
  supports_iops                        = false  # bool | optional+computed
  supports_kerberos_authentication     = false  # bool | optional+computed
  supports_multi_az                    = false  # bool | optional+computed
  supports_performance_insights        = false  # bool | optional+computed
  supports_storage_autoscaling         = false  # bool | optional+computed
  supports_storage_encryption          = false  # bool | optional+computed
  vpc                                  = false  # bool | optional+computed

  # availability_zones                   = []     # list(string) | computed
  # max_iops_per_db_instance             = 0      # number | computed
  # max_iops_per_gib                     = 0      # number | computed
  # max_storage_size                     = 0      # number | computed
  # min_iops_per_db_instance             = 0      # number | computed
  # min_iops_per_gib                     = 0      # number | computed
  # min_storage_size                     = 0      # number | computed
  # multi_az_capable                     = false  # bool | computed
  # outpost_capable                      = false  # bool | computed

}

