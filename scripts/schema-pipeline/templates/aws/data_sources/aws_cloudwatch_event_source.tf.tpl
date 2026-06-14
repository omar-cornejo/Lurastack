# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_cloudwatch_event_source                             │
# └──────────────────────────────────────────────────────────────┘
data "aws_cloudwatch_event_source" "this" {

  id          = ""     # string | optional+computed
  name_prefix = ""     # string | optional

  # arn         = ""     # string | computed
  # created_by  = ""     # string | computed
  # name        = ""     # string | computed
  # state       = ""     # string | computed

}

