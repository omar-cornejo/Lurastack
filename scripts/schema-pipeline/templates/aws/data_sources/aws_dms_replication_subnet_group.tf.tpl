# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_dms_replication_subnet_group                        │
# └──────────────────────────────────────────────────────────────┘
data "aws_dms_replication_subnet_group" "this" {

  replication_subnet_group_id          = ""     # string | required
  id                                   = ""     # string | optional+computed
  tags                                 = {}     # map(string) | optional+computed

  # replication_subnet_group_arn         = ""     # string | computed
  # replication_subnet_group_description = ""     # string | computed
  # subnet_group_status                  = ""     # string | computed
  # subnet_ids                           = []     # set(string) | computed
  # vpc_id                               = ""     # string | computed

}

