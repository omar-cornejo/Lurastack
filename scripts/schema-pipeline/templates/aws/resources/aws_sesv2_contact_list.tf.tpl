# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_sesv2_contact_list                              │
# └──────────────────────────────────────────────────────────────┘
resource "aws_sesv2_contact_list" "this" {

  contact_list_name      = ""     # string | required
  description            = ""     # string | optional
  id                     = ""     # string | optional+computed
  tags                   = {}     # map(string) | optional
  tags_all               = {}     # map(string) | optional+computed

  # arn                    = ""     # string | computed
  # created_timestamp      = ""     # string | computed
  # last_updated_timestamp = ""     # string | computed

  topic { # set
    default_subscription_status = ""     # string | required
    display_name                = ""     # string | required
    topic_name                  = ""     # string | required
    description                 = ""     # string | optional

  }

}

