# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ssoadmin_permission_set                         │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ssoadmin_permission_set" "this" {

  instance_arn     = ""     # string | required
  name             = ""     # string | required
  description      = ""     # string | optional
  id               = ""     # string | optional+computed
  relay_state      = ""     # string | optional
  session_duration = ""     # string | optional
  tags             = {}     # map(string) | optional
  tags_all         = {}     # map(string) | optional+computed

  # arn              = ""     # string | computed
  # created_date     = ""     # string | computed

  timeouts { # single
    update = ""     # string | optional

  }

}

