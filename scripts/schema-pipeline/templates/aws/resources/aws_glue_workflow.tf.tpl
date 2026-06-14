# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_glue_workflow                                   │
# └──────────────────────────────────────────────────────────────┘
resource "aws_glue_workflow" "this" {

  default_run_properties = {}     # map(string) | optional
  description            = ""     # string | optional
  id                     = ""     # string | optional+computed
  max_concurrent_runs    = 0      # number | optional
  name                   = ""     # string | optional
  tags                   = {}     # map(string) | optional
  tags_all               = {}     # map(string) | optional+computed

  # arn                    = ""     # string | computed

}

