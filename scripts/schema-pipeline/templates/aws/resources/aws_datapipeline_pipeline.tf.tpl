# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_datapipeline_pipeline                           │
# └──────────────────────────────────────────────────────────────┘
resource "aws_datapipeline_pipeline" "this" {

  name        = ""     # string | required
  description = ""     # string | optional
  id          = ""     # string | optional+computed
  tags        = {}     # map(string) | optional
  tags_all    = {}     # map(string) | optional+computed

}

