# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_appstream_user                                  │
# └──────────────────────────────────────────────────────────────┘
resource "aws_appstream_user" "this" {

  authentication_type     = ""     # string | required
  user_name               = ""     # string | required
  enabled                 = false  # bool | optional
  first_name              = ""     # string | optional
  id                      = ""     # string | optional+computed
  last_name               = ""     # string | optional
  send_email_notification = false  # bool | optional

  # arn                     = ""     # string | computed
  # created_time            = ""     # string | computed

}

