# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_autoscaling_lifecycle_hook                      │
# └──────────────────────────────────────────────────────────────┘
resource "aws_autoscaling_lifecycle_hook" "this" {

  autoscaling_group_name  = ""     # string | required
  lifecycle_transition    = ""     # string | required
  name                    = ""     # string | required
  default_result          = ""     # string | optional+computed
  heartbeat_timeout       = 0      # number | optional
  id                      = ""     # string | optional+computed
  notification_metadata   = ""     # string | optional
  notification_target_arn = ""     # string | optional
  role_arn                = ""     # string | optional

}

