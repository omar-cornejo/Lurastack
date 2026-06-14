# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_launch_configuration                                │
# └──────────────────────────────────────────────────────────────┘
data "aws_launch_configuration" "this" {

  name                        = ""     # string | required
  id                          = ""     # string | optional+computed

  # arn                         = ""     # string | computed
  # associate_public_ip_address = false  # bool | computed
  # ebs_block_device = [  # set(object)
  #   {
  #     delete_on_termination = false
  #     device_name = ""
  #     encrypted = false
  #     iops = 0
  #     no_device = false
  #     snapshot_id = ""
  #     throughput = 0
  #     volume_size = 0
  #     volume_type = ""
  #   }
  # ]
  # ebs_optimized               = false  # bool | computed
  # enable_monitoring           = false  # bool | computed
  # ephemeral_block_device = [  # set(object)
  #   {
  #     device_name = ""
  #     virtual_name = ""
  #   }
  # ]
  # iam_instance_profile        = ""     # string | computed
  # image_id                    = ""     # string | computed
  # instance_type               = ""     # string | computed
  # key_name                    = ""     # string | computed
  # metadata_options = [  # list(object)
  #   {
  #     http_endpoint = ""
  #     http_put_response_hop_limit = 0
  #     http_tokens = ""
  #   }
  # ]
  # placement_tenancy           = ""     # string | computed
  # root_block_device = [  # list(object)
  #   {
  #     delete_on_termination = false
  #     encrypted = false
  #     iops = 0
  #     throughput = 0
  #     volume_size = 0
  #     volume_type = ""
  #   }
  # ]
  # security_groups             = []     # set(string) | computed
  # spot_price                  = ""     # string | computed
  # user_data                   = ""     # string | computed

}

