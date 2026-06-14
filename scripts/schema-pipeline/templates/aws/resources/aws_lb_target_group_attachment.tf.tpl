# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_lb_target_group_attachment                      │
# └──────────────────────────────────────────────────────────────┘
resource "aws_lb_target_group_attachment" "this" {

  target_group_arn  = ""     # string | required
  target_id         = ""     # string | required
  availability_zone = ""     # string | optional
  id                = ""     # string | optional+computed
  port              = 0      # number | optional

}

