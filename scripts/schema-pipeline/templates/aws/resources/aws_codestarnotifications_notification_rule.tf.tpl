# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_codestarnotifications_notification_rule         │
# └──────────────────────────────────────────────────────────────┘
resource "aws_codestarnotifications_notification_rule" "this" {

  detail_type    = ""     # string | required
  event_type_ids = []     # set(string) | required
  name           = ""     # string | required
  resource       = ""     # string | required
  id             = ""     # string | optional+computed
  status         = ""     # string | optional
  tags           = {}     # map(string) | optional
  tags_all       = {}     # map(string) | optional+computed

  # arn            = ""     # string | computed

  target { # set [0..10]
    address = ""     # string | required
    type    = ""     # string | optional

    # status  = ""     # string | computed

  }

}

