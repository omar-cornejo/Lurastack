# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_fsx_ontap_file_system                           │
# └──────────────────────────────────────────────────────────────┘
resource "aws_fsx_ontap_file_system" "this" {

  deployment_type                   = ""     # string | required
  preferred_subnet_id               = ""     # string | required
  storage_capacity                  = 0      # number | required
  subnet_ids                        = []     # list(string) | required
  automatic_backup_retention_days   = 0      # number | optional
  daily_automatic_backup_start_time = ""     # string | optional+computed
  endpoint_ip_address_range         = ""     # string | optional+computed
  fsx_admin_password                = ""     # string | optional+sensitive
  ha_pairs                          = 0      # number | optional+computed
  id                                = ""     # string | optional+computed
  kms_key_id                        = ""     # string | optional+computed
  route_table_ids                   = []     # set(string) | optional+computed
  security_group_ids                = []     # set(string) | optional
  storage_type                      = ""     # string | optional
  tags                              = {}     # map(string) | optional
  tags_all                          = {}     # map(string) | optional+computed
  throughput_capacity               = 0      # number | optional+computed
  throughput_capacity_per_ha_pair   = 0      # number | optional+computed
  weekly_maintenance_start_time     = ""     # string | optional+computed

  # arn                               = ""     # string | computed
  # dns_name                          = ""     # string | computed
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
  # network_interface_ids             = []     # list(string) | computed
  # owner_id                          = ""     # string | computed
  # vpc_id                            = ""     # string | computed

  disk_iops_configuration { # list [0..1]
    iops = 0      # number | optional+computed
    mode = ""     # string | optional

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

