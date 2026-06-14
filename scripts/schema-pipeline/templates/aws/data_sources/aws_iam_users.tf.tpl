# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_iam_users                                           │
# └──────────────────────────────────────────────────────────────┘
data "aws_iam_users" "this" {

  id          = ""     # string | optional+computed
  name_regex  = ""     # string | optional
  path_prefix = ""     # string | optional

  # arns        = []     # set(string) | computed
  # names       = []     # set(string) | computed

}

