# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_appstream_user_stack_association                │
# └──────────────────────────────────────────────────────────────┘
resource "aws_appstream_user_stack_association" "this" {

  authentication_type     = ""     # string | required
  stack_name              = ""     # string | required
  user_name               = ""     # string | required
  id                      = ""     # string | optional+computed
  send_email_notification = false  # bool | optional

}

