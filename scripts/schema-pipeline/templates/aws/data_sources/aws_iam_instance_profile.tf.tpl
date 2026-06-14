# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_iam_instance_profile                                │
# └──────────────────────────────────────────────────────────────┘
data "aws_iam_instance_profile" "this" {

  name        = ""     # string | required
  id          = ""     # string | optional+computed

  # arn         = ""     # string | computed
  # create_date = ""     # string | computed
  # path        = ""     # string | computed
  # role_arn    = ""     # string | computed
  # role_id     = ""     # string | computed
  # role_name   = ""     # string | computed

}

