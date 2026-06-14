# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_appintegrations_event_integration                   │
# └──────────────────────────────────────────────────────────────┘
data "aws_appintegrations_event_integration" "this" {

  name            = ""     # string | required
  id              = ""     # string | optional+computed
  tags            = {}     # map(string) | optional+computed

  # arn             = ""     # string | computed
  # description     = ""     # string | computed
  # event_filter = [  # list(object)
  #   {
  #     source = ""
  #   }
  # ]
  # eventbridge_bus = ""     # string | computed

}

