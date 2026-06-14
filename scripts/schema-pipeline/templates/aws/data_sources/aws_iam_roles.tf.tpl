# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_iam_roles                                           │
# └──────────────────────────────────────────────────────────────┘
data "aws_iam_roles" "this" {

  id          = ""     # string | optional+computed
  name_regex  = ""     # string | optional
  path_prefix = ""     # string | optional

  # arns        = []     # set(string) | computed
  # names       = []     # set(string) | computed

}

