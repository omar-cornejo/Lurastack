# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_devopsguru_notification_channel                 │
# └──────────────────────────────────────────────────────────────┘
resource "aws_devopsguru_notification_channel" "this" {


  # id = ""     # string | computed

  filters { # list
    message_types = []     # set(string) | optional
    severities    = []     # set(string) | optional

  }

  sns { # list
    topic_arn = ""     # string | required

  }

}

