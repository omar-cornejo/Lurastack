# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_dataexchange_revision                           │
# └──────────────────────────────────────────────────────────────┘
resource "aws_dataexchange_revision" "this" {

  data_set_id = ""     # string | required
  comment     = ""     # string | optional
  id          = ""     # string | optional+computed
  tags        = {}     # map(string) | optional
  tags_all    = {}     # map(string) | optional+computed

  # arn         = ""     # string | computed
  # revision_id = ""     # string | computed

}

