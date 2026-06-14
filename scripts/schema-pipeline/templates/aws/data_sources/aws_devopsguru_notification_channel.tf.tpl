# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_devopsguru_notification_channel                     │
# └──────────────────────────────────────────────────────────────┘
data "aws_devopsguru_notification_channel" "this" {

  id = ""     # string | required

  filters { # list

    # message_types = []     # list(string) | computed
    # severities    = []     # list(string) | computed

  }

  sns { # list

    # topic_arn = ""     # string | computed

  }

}

