# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_appautoscaling_scheduled_action                 │
# └──────────────────────────────────────────────────────────────┘
resource "aws_appautoscaling_scheduled_action" "this" {

  name               = ""     # string | required
  resource_id        = ""     # string | required
  scalable_dimension = ""     # string | required
  schedule           = ""     # string | required
  service_namespace  = ""     # string | required
  end_time           = ""     # string | optional
  id                 = ""     # string | optional+computed
  start_time         = ""     # string | optional
  timezone           = ""     # string | optional

  # arn                = ""     # string | computed

  scalable_target_action { # list [1..1]
    max_capacity = ""     # string | optional
    min_capacity = ""     # string | optional

  }

}

