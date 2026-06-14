# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_autoscaling_notification                        │
# └──────────────────────────────────────────────────────────────┘
resource "aws_autoscaling_notification" "this" {

  group_names   = []     # set(string) | required
  notifications = []     # set(string) | required
  topic_arn     = ""     # string | required
  id            = ""     # string | optional+computed

}

