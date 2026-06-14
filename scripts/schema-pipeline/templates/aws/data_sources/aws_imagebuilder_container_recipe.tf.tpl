# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_imagebuilder_container_recipe                       │
# └──────────────────────────────────────────────────────────────┘
data "aws_imagebuilder_container_recipe" "this" {

  arn                      = ""     # string | required
  id                       = ""     # string | optional+computed
  tags                     = {}     # map(string) | optional+computed

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
  # container_type           = ""     # string | computed
  # date_created             = ""     # string | computed
  # description              = ""     # string | computed
  # dockerfile_template_data = ""     # string | computed
  # encrypted                = false  # bool | computed
  # instance_configuration = [  # list(object)
  #   {
  #     block_device_mapping = [  # set(object)
  #       {
  #         device_name = ""
  #         ebs = [  # list(object)
  #           {
  #             delete_on_termination = false
  #             encrypted = false
  #             iops = 0
  #             kms_key_id = ""
  #             snapshot_id = ""
  #             throughput = 0
  #             volume_size = 0
  #             volume_type = ""
  #           }
  #         ]
  #         no_device = ""
  #         virtual_name = ""
  #       }
  #     ]
  #     image = ""
  #   }
  # ]
  # kms_key_id               = ""     # string | computed
  # name                     = ""     # string | computed
  # owner                    = ""     # string | computed
  # parent_image             = ""     # string | computed
  # platform                 = ""     # string | computed
  # target_repository = [  # list(object)
  #   {
  #     repository_name = ""
  #     service = ""
  #   }
  # ]
  # version                  = ""     # string | computed
  # working_directory        = ""     # string | computed

}

