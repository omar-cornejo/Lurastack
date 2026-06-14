# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_load_balancer_policy                            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_load_balancer_policy" "this" {

  load_balancer_name = ""     # string | required
  policy_name        = ""     # string | required
  policy_type_name   = ""     # string | required
  id                 = ""     # string | optional+computed

  policy_attribute { # set
    name  = ""     # string | optional
    value = ""     # string | optional

  }

}

