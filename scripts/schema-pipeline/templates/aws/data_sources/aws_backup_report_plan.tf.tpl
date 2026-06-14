# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_backup_report_plan                                  │
# └──────────────────────────────────────────────────────────────┘
data "aws_backup_report_plan" "this" {

  name                    = ""     # string | required
  id                      = ""     # string | optional+computed
  tags                    = {}     # map(string) | optional+computed

  # arn                     = ""     # string | computed
  # creation_time           = ""     # string | computed
  # deployment_status       = ""     # string | computed
  # description             = ""     # string | computed
  # report_delivery_channel = [  # list(object)
  #   {
  #     formats = []  # set(string)
  #     s3_bucket_name = ""
  #     s3_key_prefix = ""
  #   }
  # ]
  # report_setting = [  # list(object)
  #   {
  #     accounts = []  # set(string)
  #     framework_arns = []  # set(string)
  #     number_of_frameworks = 0
  #     organization_units = []  # set(string)
  #     regions = []  # set(string)
  #     report_template = ""
  #   }
  # ]

}

