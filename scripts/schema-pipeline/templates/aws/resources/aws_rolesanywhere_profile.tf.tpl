# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_rolesanywhere_profile                           │
# └──────────────────────────────────────────────────────────────┘
resource "aws_rolesanywhere_profile" "this" {

  name                        = ""     # string | required
  duration_seconds            = 0      # number | optional+computed
  enabled                     = false  # bool | optional
  id                          = ""     # string | optional+computed
  managed_policy_arns         = []     # set(string) | optional
  require_instance_properties = false  # bool | optional
  role_arns                   = []     # set(string) | optional
  session_policy              = ""     # string | optional
  tags                        = {}     # map(string) | optional
  tags_all                    = {}     # map(string) | optional+computed

  # arn                         = ""     # string | computed

}

