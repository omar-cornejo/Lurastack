# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_appintegrations_event_integration               │
# └──────────────────────────────────────────────────────────────┘
resource "aws_appintegrations_event_integration" "this" {

  eventbridge_bus = ""     # string | required
  name            = ""     # string | required
  description     = ""     # string | optional
  id              = ""     # string | optional+computed
  tags            = {}     # map(string) | optional
  tags_all        = {}     # map(string) | optional+computed

  # arn             = ""     # string | computed

  event_filter { # list [1..1]
    source = ""     # string | required

  }

}

