# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_cloudwatch_event_rule                           │
# └──────────────────────────────────────────────────────────────┘
resource "aws_cloudwatch_event_rule" "this" {

  description         = ""     # string | optional
  event_bus_name      = ""     # string | optional
  event_pattern       = ""     # string | optional
  force_destroy       = false  # bool | optional
  id                  = ""     # string | optional+computed
  is_enabled          = false  # bool | optional+DEPRECATED
  name                = ""     # string | optional+computed
  name_prefix         = ""     # string | optional+computed
  role_arn            = ""     # string | optional
  schedule_expression = ""     # string | optional
  state               = ""     # string | optional
  tags                = {}     # map(string) | optional
  tags_all            = {}     # map(string) | optional+computed

  # arn                 = ""     # string | computed

}

