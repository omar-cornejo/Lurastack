# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_imagebuilder_image_pipeline                         │
# └──────────────────────────────────────────────────────────────┘
data "aws_imagebuilder_image_pipeline" "this" {

  arn                              = ""     # string | required
  id                               = ""     # string | optional+computed
  tags                             = {}     # map(string) | optional+computed

  # container_recipe_arn             = ""     # string | computed
  # date_created                     = ""     # string | computed
  # date_last_run                    = ""     # string | computed
  # date_next_run                    = ""     # string | computed
  # date_updated                     = ""     # string | computed
  # description                      = ""     # string | computed
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
  # platform                         = ""     # string | computed
  # schedule = [  # list(object)
  #   {
  #     pipeline_execution_start_condition = ""
  #     schedule_expression = ""
  #   }
  # ]
  # status                           = ""     # string | computed

}

