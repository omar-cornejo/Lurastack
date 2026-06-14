# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_autoscaling_schedule                            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_autoscaling_schedule" "this" {

  autoscaling_group_name = ""     # string | required
  scheduled_action_name  = ""     # string | required
  desired_capacity       = 0      # number | optional+computed
  end_time               = ""     # string | optional+computed
  id                     = ""     # string | optional+computed
  max_size               = 0      # number | optional+computed
  min_size               = 0      # number | optional+computed
  recurrence             = ""     # string | optional+computed
  start_time             = ""     # string | optional+computed
  time_zone              = ""     # string | optional+computed

  # arn                    = ""     # string | computed

}

