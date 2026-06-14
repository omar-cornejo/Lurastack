# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_iot_provisioning_template                       │
# └──────────────────────────────────────────────────────────────┘
resource "aws_iot_provisioning_template" "this" {

  name                  = ""     # string | required
  provisioning_role_arn = ""     # string | required
  template_body         = ""     # string | required
  description           = ""     # string | optional
  enabled               = false  # bool | optional
  id                    = ""     # string | optional+computed
  tags                  = {}     # map(string) | optional
  tags_all              = {}     # map(string) | optional+computed
  type                  = ""     # string | optional+computed

  # arn                   = ""     # string | computed
  # default_version_id    = 0      # number | computed

  pre_provisioning_hook { # list [0..1]
    target_arn      = ""     # string | required
    payload_version = ""     # string | optional

  }

}

