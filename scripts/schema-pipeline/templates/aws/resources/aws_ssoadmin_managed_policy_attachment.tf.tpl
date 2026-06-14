# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ssoadmin_managed_policy_attachment              │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ssoadmin_managed_policy_attachment" "this" {

  instance_arn        = ""     # string | required
  managed_policy_arn  = ""     # string | required
  permission_set_arn  = ""     # string | required
  id                  = ""     # string | optional+computed

  # managed_policy_name = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

