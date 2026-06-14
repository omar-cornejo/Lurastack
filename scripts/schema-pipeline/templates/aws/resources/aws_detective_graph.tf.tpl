# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_detective_graph                                 │
# └──────────────────────────────────────────────────────────────┘
resource "aws_detective_graph" "this" {

  id           = ""     # string | optional+computed
  tags         = {}     # map(string) | optional
  tags_all     = {}     # map(string) | optional+computed

  # created_time = ""     # string | computed
  # graph_arn    = ""     # string | computed

}

