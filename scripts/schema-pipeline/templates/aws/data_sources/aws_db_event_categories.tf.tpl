# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_db_event_categories                                 │
# └──────────────────────────────────────────────────────────────┘
data "aws_db_event_categories" "this" {

  id               = ""     # string | optional+computed
  source_type      = ""     # string | optional

  # event_categories = []     # list(string) | computed

}

