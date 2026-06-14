# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_apprunner_observability_configuration           │
# └──────────────────────────────────────────────────────────────┘
resource "aws_apprunner_observability_configuration" "this" {

  observability_configuration_name     = ""     # string | required
  id                                   = ""     # string | optional+computed
  tags                                 = {}     # map(string) | optional
  tags_all                             = {}     # map(string) | optional+computed

  # arn                                  = ""     # string | computed
  # latest                               = false  # bool | computed
  # observability_configuration_revision = 0      # number | computed
  # status                               = ""     # string | computed

  trace_configuration { # list [0..1]
    vendor = ""     # string | optional

  }

}

