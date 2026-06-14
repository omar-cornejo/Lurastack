# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_elastic_beanstalk_application                       │
# └──────────────────────────────────────────────────────────────┘
data "aws_elastic_beanstalk_application" "this" {

  name                 = ""     # string | required
  id                   = ""     # string | optional+computed

  # appversion_lifecycle = [  # list(object)
  #   {
  #     delete_source_from_s3 = false
  #     max_age_in_days = 0
  #     max_count = 0
  #     service_role = ""
  #   }
  # ]
  # arn                  = ""     # string | computed
  # description          = ""     # string | computed

}

