# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_appautoscaling_target                           │
# └──────────────────────────────────────────────────────────────┘
resource "aws_appautoscaling_target" "this" {

  max_capacity       = 0      # number | required
  min_capacity       = 0      # number | required
  resource_id        = ""     # string | required
  scalable_dimension = ""     # string | required
  service_namespace  = ""     # string | required
  id                 = ""     # string | optional+computed
  role_arn           = ""     # string | optional+computed
  tags               = {}     # map(string) | optional
  tags_all           = {}     # map(string) | optional+computed

  # arn                = ""     # string | computed

  suspended_state { # list [0..1]
    dynamic_scaling_in_suspended  = false  # bool | optional
    dynamic_scaling_out_suspended = false  # bool | optional
    scheduled_scaling_suspended   = false  # bool | optional

  }

}

