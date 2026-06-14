# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_autoscaling_attachment                          │
# └──────────────────────────────────────────────────────────────┘
resource "aws_autoscaling_attachment" "this" {

  autoscaling_group_name = ""     # string | required
  elb                    = ""     # string | optional
  id                     = ""     # string | optional+computed
  lb_target_group_arn    = ""     # string | optional

}

