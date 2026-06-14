# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_elasticache_user_group                          │
# └──────────────────────────────────────────────────────────────┘
resource "aws_elasticache_user_group" "this" {

  engine        = ""     # string | required
  user_group_id = ""     # string | required
  id            = ""     # string | optional+computed
  tags          = {}     # map(string) | optional
  tags_all      = {}     # map(string) | optional+computed
  user_ids      = []     # set(string) | optional

  # arn           = ""     # string | computed

}

