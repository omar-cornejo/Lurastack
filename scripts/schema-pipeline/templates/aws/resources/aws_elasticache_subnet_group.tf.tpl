# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_elasticache_subnet_group                        │
# └──────────────────────────────────────────────────────────────┘
resource "aws_elasticache_subnet_group" "this" {

  name        = ""     # string | required
  subnet_ids  = []     # set(string) | required
  description = ""     # string | optional
  id          = ""     # string | optional+computed
  tags        = {}     # map(string) | optional
  tags_all    = {}     # map(string) | optional+computed

  # arn         = ""     # string | computed
  # vpc_id      = ""     # string | computed

}

