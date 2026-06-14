# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_fsx_ontap_file_system                               │
# └──────────────────────────────────────────────────────────────┘
data "aws_fsx_ontap_file_system" "this" {

  id                                = ""     # string | required
  tags                              = {}     # map(string) | optional+computed

  # arn                               = ""     # string | computed
  # automatic_backup_retention_days   = 0      # number | computed
  # daily_automatic_backup_start_time = ""     # string | computed
  # deployment_type                   = ""     # string | computed
  # disk_iops_configuration = [  # list(object)
  #   {
  #     iops = 0
  #     mode = ""
  #   }
  # ]
  # dns_name                          = ""     # string | computed
  # endpoint_ip_address_range         = ""     # string | computed
  # endpoints = [  # list(object)
  #   {
  #     intercluster = [  # list(object)
  #       {
  #         dns_name = ""
  #         ip_addresses = []  # set(string)
  #       }
  #     ]
  #     management = [  # list(object)
  #       {
  #         dns_name = ""
  #         ip_addresses = []  # set(string)
  #       }
  #     ]
  #   }
  # ]
  # ha_pairs                          = 0      # number | computed
  # kms_key_id                        = ""     # string | computed
  # network_interface_ids             = []     # list(string) | computed
  # owner_id                          = ""     # string | computed
  # preferred_subnet_id               = ""     # string | computed
  # route_table_ids                   = []     # set(string) | computed
  # storage_capacity                  = 0      # number | computed
  # storage_type                      = ""     # string | computed
  # subnet_ids                        = []     # list(string) | computed
  # throughput_capacity               = 0      # number | computed
  # throughput_capacity_per_ha_pair   = 0      # number | computed
  # vpc_id                            = ""     # string | computed
  # weekly_maintenance_start_time     = ""     # string | computed

}

