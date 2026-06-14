# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_evidently_segment                               │
# └──────────────────────────────────────────────────────────────┘
resource "aws_evidently_segment" "this" {

  name              = ""     # string | required
  pattern           = ""     # string | required
  description       = ""     # string | optional
  id                = ""     # string | optional+computed
  tags              = {}     # map(string) | optional
  tags_all          = {}     # map(string) | optional+computed

  # arn               = ""     # string | computed
  # created_time      = ""     # string | computed
  # experiment_count  = 0      # number | computed
  # last_updated_time = ""     # string | computed
  # launch_count      = 0      # number | computed

}

