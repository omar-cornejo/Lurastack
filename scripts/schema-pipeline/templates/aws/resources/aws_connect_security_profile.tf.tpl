# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_connect_security_profile                        │
# └──────────────────────────────────────────────────────────────┘
resource "aws_connect_security_profile" "this" {

  instance_id              = ""     # string | required
  name                     = ""     # string | required
  description              = ""     # string | optional
  id                       = ""     # string | optional+computed
  permissions              = []     # set(string) | optional
  tags                     = {}     # map(string) | optional
  tags_all                 = {}     # map(string) | optional+computed

  # arn                      = ""     # string | computed
  # organization_resource_id = ""     # string | computed
  # security_profile_id      = ""     # string | computed

}

