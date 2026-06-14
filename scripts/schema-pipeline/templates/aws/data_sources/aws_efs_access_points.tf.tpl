# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_efs_access_points                                   │
# └──────────────────────────────────────────────────────────────┘
data "aws_efs_access_points" "this" {

  file_system_id = ""     # string | required
  id             = ""     # string | optional+computed

  # arns           = []     # list(string) | computed
  # ids            = []     # list(string) | computed

}

