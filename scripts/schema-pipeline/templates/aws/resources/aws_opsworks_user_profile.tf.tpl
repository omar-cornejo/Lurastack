# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_opsworks_user_profile                           │
# └──────────────────────────────────────────────────────────────┘
# ⚠ DEPRECATED: this resource type is deprecated
resource "aws_opsworks_user_profile" "this" {

  ssh_username          = ""     # string | required
  user_arn              = ""     # string | required
  allow_self_management = false  # bool | optional
  id                    = ""     # string | optional+computed
  ssh_public_key        = ""     # string | optional

}

