# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_ssoadmin_permission_set                             │
# └──────────────────────────────────────────────────────────────┘
data "aws_ssoadmin_permission_set" "this" {

  instance_arn     = ""     # string | required
  arn              = ""     # string | optional+computed
  id               = ""     # string | optional+computed
  name             = ""     # string | optional+computed
  tags             = {}     # map(string) | optional+computed

  # created_date     = ""     # string | computed
  # description      = ""     # string | computed
  # relay_state      = ""     # string | computed
  # session_duration = ""     # string | computed

}

