# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_storagegateway_gateway                          │
# └──────────────────────────────────────────────────────────────┘
resource "aws_storagegateway_gateway" "this" {

  gateway_name                                = ""     # string | required
  gateway_timezone                            = ""     # string | required
  activation_key                              = ""     # string | optional+computed
  average_download_rate_limit_in_bits_per_sec = 0      # number | optional
  average_upload_rate_limit_in_bits_per_sec   = 0      # number | optional
  cloudwatch_log_group_arn                    = ""     # string | optional
  gateway_ip_address                          = ""     # string | optional+computed
  gateway_type                                = ""     # string | optional
  gateway_vpc_endpoint                        = ""     # string | optional
  id                                          = ""     # string | optional+computed
  medium_changer_type                         = ""     # string | optional
  smb_file_share_visibility                   = false  # bool | optional
  smb_guest_password                          = ""     # string | optional+sensitive
  smb_security_strategy                       = ""     # string | optional+computed
  tags                                        = {}     # map(string) | optional
  tags_all                                    = {}     # map(string) | optional+computed
  tape_drive_type                             = ""     # string | optional

  # arn                                         = ""     # string | computed
  # ec2_instance_id                             = ""     # string | computed
  # endpoint_type                               = ""     # string | computed
  # gateway_id                                  = ""     # string | computed
  # gateway_network_interface = [  # list(object)
  #   {
  #     ipv4_address = ""
  #   }
  # ]
  # host_environment                            = ""     # string | computed

  maintenance_start_time { # list [0..1]
    hour_of_day    = 0      # number | required
    day_of_month   = ""     # string | optional
    day_of_week    = ""     # string | optional
    minute_of_hour = 0      # number | optional

  }

  smb_active_directory_settings { # list [0..1]
    domain_name             = ""     # string | required
    password                = ""     # string | required+sensitive
    username                = ""     # string | required
    domain_controllers      = []     # set(string) | optional
    organizational_unit     = ""     # string | optional
    timeout_in_seconds      = 0      # number | optional

    # active_directory_status = ""     # string | computed

  }

  timeouts { # single
    create = ""     # string | optional

  }

}

