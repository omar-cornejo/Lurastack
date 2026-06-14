# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_cloudwatch_log_groups                               │
# └──────────────────────────────────────────────────────────────┘
data "aws_cloudwatch_log_groups" "this" {

  id                    = ""     # string | optional+computed
  log_group_name_prefix = ""     # string | optional

  # arns                  = []     # set(string) | computed
  # log_group_names       = []     # set(string) | computed

}

