# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_scheduler_schedule_group                        │
# └──────────────────────────────────────────────────────────────┘
resource "aws_scheduler_schedule_group" "this" {

  id                     = ""     # string | optional+computed
  name                   = ""     # string | optional+computed
  name_prefix            = ""     # string | optional+computed
  tags                   = {}     # map(string) | optional
  tags_all               = {}     # map(string) | optional+computed

  # arn                    = ""     # string | computed
  # creation_date          = ""     # string | computed
  # last_modification_date = ""     # string | computed
  # state                  = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

