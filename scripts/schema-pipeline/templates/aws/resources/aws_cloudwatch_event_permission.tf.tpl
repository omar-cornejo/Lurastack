# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_cloudwatch_event_permission                     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_cloudwatch_event_permission" "this" {

  principal      = ""     # string | required
  statement_id   = ""     # string | required
  action         = ""     # string | optional
  event_bus_name = ""     # string | optional
  id             = ""     # string | optional+computed

  condition { # list [0..1]
    key   = ""     # string | required
    type  = ""     # string | required
    value = ""     # string | required

  }

}

