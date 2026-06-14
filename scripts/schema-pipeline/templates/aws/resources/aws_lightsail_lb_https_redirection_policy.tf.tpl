# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_lightsail_lb_https_redirection_policy           │
# └──────────────────────────────────────────────────────────────┘
resource "aws_lightsail_lb_https_redirection_policy" "this" {

  enabled = false  # bool | required
  lb_name = ""     # string | required
  id      = ""     # string | optional+computed

}

