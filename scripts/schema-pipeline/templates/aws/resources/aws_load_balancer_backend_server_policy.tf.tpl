# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_load_balancer_backend_server_policy             │
# └──────────────────────────────────────────────────────────────┘
resource "aws_load_balancer_backend_server_policy" "this" {

  instance_port      = 0      # number | required
  load_balancer_name = ""     # string | required
  id                 = ""     # string | optional+computed
  policy_names       = []     # set(string) | optional

}

