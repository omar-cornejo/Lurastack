# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_imagebuilder_image_recipe                           │
# └──────────────────────────────────────────────────────────────┘
data "aws_imagebuilder_image_recipe" "this" {

  arn                  = ""     # string | required
  id                   = ""     # string | optional+computed
  tags                 = {}     # map(string) | optional+computed

  # block_device_mapping = [  # set(object)
  #   {
  #     device_name = ""
  #     ebs = [  # list(object)
  #       {
  #         delete_on_termination = ""
  #         encrypted = ""
  #         iops = 0
  #         kms_key_id = ""
  #         snapshot_id = ""
  #         throughput = 0
  #         volume_size = 0
  #         volume_type = ""
  #       }
  #     ]
  #     no_device = ""
  #     virtual_name = ""
  #   }
  # ]
  # component = [  # list(object)
  #   {
  #     component_arn = ""
  #     parameter = [  # set(object)
  #       {
  #         name = ""
  #         value = ""
  #       }
  #     ]
  #   }
  # ]
  # date_created         = ""     # string | computed
  # description          = ""     # string | computed
  # name                 = ""     # string | computed
  # owner                = ""     # string | computed
  # parent_image         = ""     # string | computed
  # platform             = ""     # string | computed
  # user_data_base64     = ""     # string | computed
  # version              = ""     # string | computed
  # working_directory    = ""     # string | computed

}

