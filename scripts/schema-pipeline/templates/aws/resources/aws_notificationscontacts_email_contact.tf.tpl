# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_notificationscontacts_email_contact             │
# └──────────────────────────────────────────────────────────────┘
resource "aws_notificationscontacts_email_contact" "this" {

  email_address = ""     # string | required
  name          = ""     # string | required
  tags          = {}     # map(string) | optional

  # arn           = ""     # string | computed
  # tags_all      = {}     # map(string) | computed

}

