# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_detective_member                                │
# └──────────────────────────────────────────────────────────────┘
resource "aws_detective_member" "this" {

  account_id                 = ""     # string | required
  email_address              = ""     # string | required
  graph_arn                  = ""     # string | required
  disable_email_notification = false  # bool | optional
  id                         = ""     # string | optional+computed
  message                    = ""     # string | optional

  # administrator_id           = ""     # string | computed
  # disabled_reason            = ""     # string | computed
  # invited_time               = ""     # string | computed
  # status                     = ""     # string | computed
  # updated_time               = ""     # string | computed
  # volume_usage_in_bytes      = ""     # string | computed

}

