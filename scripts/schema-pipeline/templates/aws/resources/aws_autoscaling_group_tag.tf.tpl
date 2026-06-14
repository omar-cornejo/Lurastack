# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_autoscaling_group_tag                           │
# └──────────────────────────────────────────────────────────────┘
resource "aws_autoscaling_group_tag" "this" {

  autoscaling_group_name = ""     # string | required
  id                     = ""     # string | optional+computed

  tag { # list [1..1]
    key                 = ""     # string | required
    propagate_at_launch = false  # bool | required
    value               = ""     # string | required

  }

}

