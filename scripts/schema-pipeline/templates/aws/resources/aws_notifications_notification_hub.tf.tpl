# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_notifications_notification_hub                  │
# └──────────────────────────────────────────────────────────────┘
resource "aws_notifications_notification_hub" "this" {

  notification_hub_region = ""     # string | required

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    delete = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}

