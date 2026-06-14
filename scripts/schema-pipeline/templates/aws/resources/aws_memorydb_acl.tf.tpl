# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_memorydb_acl                                    │
# └──────────────────────────────────────────────────────────────┘
resource "aws_memorydb_acl" "this" {

  id                     = ""     # string | optional+computed
  name                   = ""     # string | optional+computed
  name_prefix            = ""     # string | optional+computed
  tags                   = {}     # map(string) | optional
  tags_all               = {}     # map(string) | optional+computed
  user_names             = []     # set(string) | optional

  # arn                    = ""     # string | computed
  # minimum_engine_version = ""     # string | computed

}

