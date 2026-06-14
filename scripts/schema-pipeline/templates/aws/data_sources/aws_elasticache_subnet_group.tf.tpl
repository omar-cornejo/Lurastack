# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_elasticache_subnet_group                            │
# └──────────────────────────────────────────────────────────────┘
data "aws_elasticache_subnet_group" "this" {

  name        = ""     # string | required
  id          = ""     # string | optional+computed
  tags        = {}     # map(string) | optional

  # arn         = ""     # string | computed
  # description = ""     # string | computed
  # subnet_ids  = []     # set(string) | computed
  # vpc_id      = ""     # string | computed

}

