# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_rds_cluster_parameter_group                         │
# └──────────────────────────────────────────────────────────────┘
data "aws_rds_cluster_parameter_group" "this" {

  name        = ""     # string | required

  # arn         = ""     # string | computed
  # description = ""     # string | computed
  # family      = ""     # string | computed

}

