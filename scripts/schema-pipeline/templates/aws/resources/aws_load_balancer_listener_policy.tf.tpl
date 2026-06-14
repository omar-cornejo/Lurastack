# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_load_balancer_listener_policy                   │
# └──────────────────────────────────────────────────────────────┘
resource "aws_load_balancer_listener_policy" "this" {

  load_balancer_name = ""     # string | required
  load_balancer_port = 0      # number | required
  id                 = ""     # string | optional+computed
  policy_names       = []     # set(string) | optional
  triggers           = {}     # map(string) | optional

}

