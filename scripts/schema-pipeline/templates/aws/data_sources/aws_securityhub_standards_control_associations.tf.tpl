# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_securityhub_standards_control_associations          │
# └──────────────────────────────────────────────────────────────┘
data "aws_securityhub_standards_control_associations" "this" {

  security_control_id            = ""     # string | required

  # id                             = ""     # string | computed
  # standards_control_associations = [  # list(object)
  #   {
  #     association_status = ""
  #     related_requirements = []  # list(string)
  #     security_control_arn = ""
  #     security_control_id = ""
  #     standards_arn = ""
  #     standards_control_description = ""
  #     standards_control_title = ""
  #     updated_at = ""
  #     updated_reason = ""
  #   }
  # ]

}

