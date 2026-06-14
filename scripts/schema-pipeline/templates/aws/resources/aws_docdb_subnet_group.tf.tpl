# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_docdb_subnet_group                              │
# └──────────────────────────────────────────────────────────────┘
resource "aws_docdb_subnet_group" "this" {

  subnet_ids  = []     # set(string) | required
  description = ""     # string | optional
  id          = ""     # string | optional+computed
  name        = ""     # string | optional+computed
  name_prefix = ""     # string | optional+computed
  tags        = {}     # map(string) | optional
  tags_all    = {}     # map(string) | optional+computed

  # arn         = ""     # string | computed

}

