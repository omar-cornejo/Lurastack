# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ssoadmin_permissions_boundary_attachment        │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ssoadmin_permissions_boundary_attachment" "this" {

  instance_arn       = ""     # string | required
  permission_set_arn = ""     # string | required
  id                 = ""     # string | optional+computed

  permissions_boundary { # list [1..1]
    managed_policy_arn = ""     # string | optional

    customer_managed_policy_reference { # list [0..1]
      name = ""     # string | required
      path = ""     # string | optional

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

