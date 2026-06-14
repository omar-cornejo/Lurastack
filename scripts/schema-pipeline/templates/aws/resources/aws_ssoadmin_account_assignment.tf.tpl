# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ssoadmin_account_assignment                     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ssoadmin_account_assignment" "this" {

  instance_arn       = ""     # string | required
  permission_set_arn = ""     # string | required
  principal_id       = ""     # string | required
  principal_type     = ""     # string | required
  target_id          = ""     # string | required
  id                 = ""     # string | optional+computed
  target_type        = ""     # string | optional

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

