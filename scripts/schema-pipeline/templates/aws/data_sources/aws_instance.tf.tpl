# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_instance                                            │
# └──────────────────────────────────────────────────────────────┘
data "aws_instance" "this" {

  get_password_data           = false  # bool | optional
  get_user_data               = false  # bool | optional
  id                          = ""     # string | optional+computed
  instance_id                 = ""     # string | optional
  instance_tags               = {}     # map(string) | optional+computed
  tags                        = {}     # map(string) | optional+computed

  # ami                         = ""     # string | computed
  # arn                         = ""     # string | computed
  # associate_public_ip_address = false  # bool | computed
  # availability_zone           = ""     # string | computed
  # credit_specification = [  # list(object)
  #   {
  #     cpu_credits = ""
  #   }
  # ]
  # disable_api_stop            = false  # bool | computed
  # disable_api_termination     = false  # bool | computed
  # ebs_block_device = [  # set(object)
  #   {
  #     delete_on_termination = false
  #     device_name = ""
  #     encrypted = false
  #     iops = 0
  #     kms_key_id = ""
  #     snapshot_id = ""
  #     tags = {}  # map(string)
  #     throughput = 0
  #     volume_id = ""
  #     volume_size = 0
  #     volume_type = ""
  #   }
  # ]
  # ebs_optimized               = false  # bool | computed
  # enclave_options = [  # list(object)
  #   {
  #     enabled = false
  #   }
  # ]
  # ephemeral_block_device = [  # list(object)
  #   {
  #     device_name = ""
  #     no_device = false
  #     virtual_name = ""
  #   }
  # ]
  # host_id                     = ""     # string | computed
  # host_resource_group_arn     = ""     # string | computed
  # iam_instance_profile        = ""     # string | computed
  # instance_state              = ""     # string | computed
  # instance_type               = ""     # string | computed
  # ipv6_addresses              = []     # set(string) | computed
  # key_name                    = ""     # string | computed
  # launch_time                 = ""     # string | computed
  # maintenance_options = [  # list(object)
  #   {
  #     auto_recovery = ""
  #   }
  # ]
  # metadata_options = [  # list(object)
  #   {
  #     http_endpoint = ""
  #     http_protocol_ipv6 = ""
  #     http_put_response_hop_limit = 0
  #     http_tokens = ""
  #     instance_metadata_tags = ""
  #   }
  # ]
  # monitoring                  = false  # bool | computed
  # network_interface_id        = ""     # string | computed
  # outpost_arn                 = ""     # string | computed
  # password_data               = ""     # string | computed
  # placement_group             = ""     # string | computed
  # placement_partition_number  = 0      # number | computed
  # private_dns                 = ""     # string | computed
  # private_dns_name_options = [  # list(object)
  #   {
  #     enable_resource_name_dns_a_record = false
  #     enable_resource_name_dns_aaaa_record = false
  #     hostname_type = ""
  #   }
  # ]
  # private_ip                  = ""     # string | computed
  # public_dns                  = ""     # string | computed
  # public_ip                   = ""     # string | computed
  # root_block_device = [  # set(object)
  #   {
  #     delete_on_termination = false
  #     device_name = ""
  #     encrypted = false
  #     iops = 0
  #     kms_key_id = ""
  #     tags = {}  # map(string)
  #     throughput = 0
  #     volume_id = ""
  #     volume_size = 0
  #     volume_type = ""
  #   }
  # ]
  # secondary_private_ips       = []     # set(string) | computed
  # security_groups             = []     # set(string) | computed
  # source_dest_check           = false  # bool | computed
  # subnet_id                   = ""     # string | computed
  # tenancy                     = ""     # string | computed
  # user_data                   = ""     # string | computed
  # user_data_base64            = ""     # string | computed
  # vpc_security_group_ids      = []     # set(string) | computed

  filter { # set
    name   = ""     # string | required
    values = []     # set(string) | required

  }

  timeouts { # single
    read = ""     # string | optional

  }

}

