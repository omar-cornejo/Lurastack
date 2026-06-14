# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ses_identity_notification_topic                 │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ses_identity_notification_topic" "this" {

  identity                 = ""     # string | required
  notification_type        = ""     # string | required
  id                       = ""     # string | optional+computed
  include_original_headers = false  # bool | optional
  topic_arn                = ""     # string | optional

}

