# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_appstream_image                                     │
# └──────────────────────────────────────────────────────────────┘
data "aws_appstream_image" "this" {

  arn                             = ""     # string | optional+computed
  most_recent                     = false  # bool | optional
  name                            = ""     # string | optional+computed
  name_regex                      = ""     # string | optional
  type                            = ""     # string | optional

  # applications = [  # list(object)
  #   {
  #     app_block_arn = ""
  #     arn = ""
  #     created_time = ""
  #     description = ""
  #     display_name = ""
  #     enabled = false
  #     icon_s3_location = [  # list(object)
  #       {
  #         s3_bucket = ""
  #         s3_key = ""
  #       }
  #     ]
  #     icon_url = ""
  #     instance_families = []  # list(string)
  #     launch_parameters = ""
  #     launch_path = ""
  #     metadata = {}  # map(string)
  #     name = ""
  #     platforms = []  # list(string)
  #     working_directory = ""
  #   }
  # ]
  # appstream_agent_version         = ""     # string | computed
  # base_image_arn                  = ""     # string | computed
  # created_time                    = ""     # string | computed
  # description                     = ""     # string | computed
  # display_name                    = ""     # string | computed
  # image_builder_name              = ""     # string | computed
  # image_builder_supported         = false  # bool | computed
  # image_permissions = [  # list(object)
  #   {
  #     allow_fleet = false
  #     allow_image_builder = false
  #   }
  # ]
  # platform                        = ""     # string | computed
  # public_base_image_released_date = ""     # string | computed
  # state                           = ""     # string | computed
  # state_change_reason = [  # list(object)
  #   {
  #     code = ""
  #     message = ""
  #   }
  # ]

}

