# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_dms_event_subscription                          │
# └──────────────────────────────────────────────────────────────┘
resource "aws_dms_event_subscription" "this" {

  event_categories = []     # set(string) | required
  name             = ""     # string | required
  sns_topic_arn    = ""     # string | required
  source_type      = ""     # string | required
  enabled          = false  # bool | optional
  id               = ""     # string | optional+computed
  source_ids       = []     # set(string) | optional
  tags             = {}     # map(string) | optional
  tags_all         = {}     # map(string) | optional+computed

  # arn              = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

