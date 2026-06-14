# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ssoadmin_customer_managed_policy_attachment     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ssoadmin_customer_managed_policy_attachment" "this" {

  instance_arn       = ""     # string | required
  permission_set_arn = ""     # string | required
  id                 = ""     # string | optional+computed

  customer_managed_policy_reference { # list [1..1]
    name = ""     # string | required
    path = ""     # string | optional

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

