# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_neptune_orderable_db_instance                       │
# └──────────────────────────────────────────────────────────────┘
data "aws_neptune_orderable_db_instance" "this" {

  engine                               = ""     # string | optional
  engine_version                       = ""     # string | optional+computed
  id                                   = ""     # string | optional+computed
  instance_class                       = ""     # string | optional+computed
  license_model                        = ""     # string | optional
  preferred_instance_classes           = []     # list(string) | optional
  vpc                                  = false  # bool | optional+computed

  # availability_zones                   = []     # list(string) | computed
  # max_iops_per_db_instance             = 0      # number | computed
  # max_iops_per_gib                     = 0      # number | computed
  # max_storage_size                     = 0      # number | computed
  # min_iops_per_db_instance             = 0      # number | computed
  # min_iops_per_gib                     = 0      # number | computed
  # min_storage_size                     = 0      # number | computed
  # multi_az_capable                     = false  # bool | computed
  # read_replica_capable                 = false  # bool | computed
  # storage_type                         = ""     # string | computed
  # supports_enhanced_monitoring         = false  # bool | computed
  # supports_iam_database_authentication = false  # bool | computed
  # supports_iops                        = false  # bool | computed
  # supports_performance_insights        = false  # bool | computed
  # supports_storage_encryption          = false  # bool | computed

}

