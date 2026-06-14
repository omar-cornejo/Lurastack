# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_iam_instance_profiles                               │
# └──────────────────────────────────────────────────────────────┘
data "aws_iam_instance_profiles" "this" {

  role_name = ""     # string | required
  id        = ""     # string | optional+computed

  # arns      = []     # set(string) | computed
  # names     = []     # set(string) | computed
  # paths     = []     # set(string) | computed

}

