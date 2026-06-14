# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_neptune_event_subscription                      │
# └──────────────────────────────────────────────────────────────┘
resource "aws_neptune_event_subscription" "this" {

  sns_topic_arn    = ""     # string | required
  enabled          = false  # bool | optional
  event_categories = []     # set(string) | optional
  id               = ""     # string | optional+computed
  name             = ""     # string | optional+computed
  name_prefix      = ""     # string | optional+computed
  source_ids       = []     # set(string) | optional
  source_type      = ""     # string | optional
  tags             = {}     # map(string) | optional
  tags_all         = {}     # map(string) | optional+computed

  # arn              = ""     # string | computed
  # customer_aws_id  = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

