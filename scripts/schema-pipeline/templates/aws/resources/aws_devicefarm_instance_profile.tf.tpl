# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_devicefarm_instance_profile                     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_devicefarm_instance_profile" "this" {

  name                              = ""     # string | required
  description                       = ""     # string | optional
  exclude_app_packages_from_cleanup = []     # set(string) | optional
  id                                = ""     # string | optional+computed
  package_cleanup                   = false  # bool | optional
  reboot_after_use                  = false  # bool | optional
  tags                              = {}     # map(string) | optional
  tags_all                          = {}     # map(string) | optional+computed

  # arn                               = ""     # string | computed

}

