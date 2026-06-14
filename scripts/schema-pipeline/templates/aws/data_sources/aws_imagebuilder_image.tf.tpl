# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_imagebuilder_image                                  │
# └──────────────────────────────────────────────────────────────┘
data "aws_imagebuilder_image" "this" {

  arn                              = ""     # string | required
  id                               = ""     # string | optional+computed
  tags                             = {}     # map(string) | optional+computed

  # build_version_arn                = ""     # string | computed
  # container_recipe_arn             = ""     # string | computed
  # date_created                     = ""     # string | computed
  # distribution_configuration_arn   = ""     # string | computed
  # enhanced_image_metadata_enabled  = false  # bool | computed
  # image_recipe_arn                 = ""     # string | computed
  # image_scanning_configuration = [  # list(object)
  #   {
  #     ecr_configuration = [  # list(object)
  #       {
  #         container_tags = []  # set(string)
  #         repository_name = ""
  #       }
  #     ]
  #     image_scanning_enabled = false
  #   }
  # ]
  # image_tests_configuration = [  # list(object)
  #   {
  #     image_tests_enabled = false
  #     timeout_minutes = 0
  #   }
  # ]
  # infrastructure_configuration_arn = ""     # string | computed
  # name                             = ""     # string | computed
  # os_version                       = ""     # string | computed
  # output_resources = [  # list(object)
  #   {
  #     amis = [  # set(object)
  #       {
  #         account_id = ""
  #         description = ""
  #         image = ""
  #         name = ""
  #         region = ""
  #       }
  #     ]
  #     containers = [  # set(object)
  #       {
  #         image_uris = []  # set(string)
  #         region = ""
  #       }
  #     ]
  #   }
  # ]
  # platform                         = ""     # string | computed
  # version                          = ""     # string | computed

}

