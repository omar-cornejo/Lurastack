# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_efs_file_system                                     │
# └──────────────────────────────────────────────────────────────┘
data "aws_efs_file_system" "this" {

  creation_token                  = ""     # string | optional+computed
  file_system_id                  = ""     # string | optional+computed
  id                              = ""     # string | optional+computed
  tags                            = {}     # map(string) | optional+computed

  # arn                             = ""     # string | computed
  # availability_zone_id            = ""     # string | computed
  # availability_zone_name          = ""     # string | computed
  # dns_name                        = ""     # string | computed
  # encrypted                       = false  # bool | computed
  # kms_key_id                      = ""     # string | computed
  # lifecycle_policy = [  # list(object)
  #   {
  #     transition_to_archive = ""
  #     transition_to_ia = ""
  #     transition_to_primary_storage_class = ""
  #   }
  # ]
  # name                            = ""     # string | computed
  # performance_mode                = ""     # string | computed
  # protection = [  # list(object)
  #   {
  #     replication_overwrite = ""
  #   }
  # ]
  # provisioned_throughput_in_mibps = 0      # number | computed
  # size_in_bytes                   = 0      # number | computed
  # throughput_mode                 = ""     # string | computed

}

