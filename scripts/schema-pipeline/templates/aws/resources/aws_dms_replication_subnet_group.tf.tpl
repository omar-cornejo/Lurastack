# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_dms_replication_subnet_group                    │
# └──────────────────────────────────────────────────────────────┘
resource "aws_dms_replication_subnet_group" "this" {

  replication_subnet_group_description = ""     # string | required
  replication_subnet_group_id          = ""     # string | required
  subnet_ids                           = []     # set(string) | required
  id                                   = ""     # string | optional+computed
  tags                                 = {}     # map(string) | optional
  tags_all                             = {}     # map(string) | optional+computed

  # replication_subnet_group_arn         = ""     # string | computed
  # vpc_id                               = ""     # string | computed

}

