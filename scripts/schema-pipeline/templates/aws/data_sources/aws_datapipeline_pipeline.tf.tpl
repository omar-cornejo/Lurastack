# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_datapipeline_pipeline                               │
# └──────────────────────────────────────────────────────────────┘
data "aws_datapipeline_pipeline" "this" {

  pipeline_id = ""     # string | required
  id          = ""     # string | optional+computed
  tags        = {}     # map(string) | optional+computed

  # description = ""     # string | computed
  # name        = ""     # string | computed

}

