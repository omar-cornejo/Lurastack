# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_memorydb_acl                                        │
# └──────────────────────────────────────────────────────────────┘
data "aws_memorydb_acl" "this" {

  name                   = ""     # string | required
  id                     = ""     # string | optional+computed
  tags                   = {}     # map(string) | optional+computed

  # arn                    = ""     # string | computed
  # minimum_engine_version = ""     # string | computed
  # user_names             = []     # set(string) | computed

}

