# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ssoadmin_permission_set_inline_policy           │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ssoadmin_permission_set_inline_policy" "this" {

  inline_policy      = ""     # string | required
  instance_arn       = ""     # string | required
  permission_set_arn = ""     # string | required
  id                 = ""     # string | optional+computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

