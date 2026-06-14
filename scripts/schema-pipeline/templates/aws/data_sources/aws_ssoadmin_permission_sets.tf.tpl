# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_ssoadmin_permission_sets                            │
# └──────────────────────────────────────────────────────────────┘
data "aws_ssoadmin_permission_sets" "this" {

  instance_arn = ""     # string | required

  # arns         = []     # list(string) | computed
  # id           = ""     # string | computed

}

