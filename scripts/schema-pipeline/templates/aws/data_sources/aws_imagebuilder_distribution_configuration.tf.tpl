# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_imagebuilder_distribution_configuration             │
# └──────────────────────────────────────────────────────────────┘
data "aws_imagebuilder_distribution_configuration" "this" {

  arn          = ""     # string | required
  id           = ""     # string | optional+computed
  tags         = {}     # map(string) | optional+computed

  # date_created = ""     # string | computed
  # date_updated = ""     # string | computed
  # description  = ""     # string | computed
  # distribution = [  # set(object)
  #   {
  #     ami_distribution_configuration = [  # set(object)
  #       {
  #         ami_tags = {}  # map(string)
  #         description = ""
  #         kms_key_id = ""
  #         launch_permission = [  # set(object)
  #           {
  #             organization_arns = []  # set(string)
  #             organizational_unit_arns = []  # set(string)
  #             user_groups = []  # set(string)
  #             user_ids = []  # set(string)
  #           }
  #         ]
  #         name = ""
  #         target_account_ids = []  # set(string)
  #       }
  #     ]
  #     container_distribution_configuration = [  # set(object)
  #       {
  #         container_tags = []  # set(string)
  #         description = ""
  #         target_repository = [  # set(object)
  #           {
  #             repository_name = ""
  #             service = ""
  #           }
  #         ]
  #       }
  #     ]
  #     fast_launch_configuration = [  # set(object)
  #       {
  #         account_id = ""
  #         enabled = false
  #         launch_template = [  # set(object)
  #           {
  #             launch_template_id = ""
  #             launch_template_name = ""
  #             launch_template_version = ""
  #           }
  #         ]
  #         max_parallel_launches = 0
  #         snapshot_configuration = [  # set(object)
  #           {
  #             target_resource_count = 0
  #           }
  #         ]
  #       }
  #     ]
  #     launch_template_configuration = [  # set(object)
  #       {
  #         account_id = ""
  #         default = false
  #         launch_template_id = ""
  #       }
  #     ]
  #     license_configuration_arns = []  # set(string)
  #     region = ""
  #     s3_export_configuration = [  # set(object)
  #       {
  #         disk_image_format = ""
  #         role_name = ""
  #         s3_bucket = ""
  #         s3_prefix = ""
  #       }
  #     ]
  #     ssm_parameter_configuration = [  # set(object)
  #       {
  #         ami_account_id = ""
  #         data_type = ""
  #         parameter_name = ""
  #       }
  #     ]
  #   }
  # ]
  # name         = ""     # string | computed

}

