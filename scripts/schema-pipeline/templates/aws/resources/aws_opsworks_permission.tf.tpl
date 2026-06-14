# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_opsworks_permission                             │
# └──────────────────────────────────────────────────────────────┘
# ⚠ DEPRECATED: this resource type is deprecated
resource "aws_opsworks_permission" "this" {

  stack_id   = ""     # string | required
  user_arn   = ""     # string | required
  allow_ssh  = false  # bool | optional+computed
  allow_sudo = false  # bool | optional+computed
  id         = ""     # string | optional+computed
  level      = ""     # string | optional+computed

}

