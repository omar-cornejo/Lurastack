# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_connect_security_profile                            │
# └──────────────────────────────────────────────────────────────┘
data "aws_connect_security_profile" "this" {

  instance_id              = ""     # string | required
  id                       = ""     # string | optional+computed
  name                     = ""     # string | optional+computed
  security_profile_id      = ""     # string | optional+computed
  tags                     = {}     # map(string) | optional+computed

  # arn                      = ""     # string | computed
  # description              = ""     # string | computed
  # organization_resource_id = ""     # string | computed
  # permissions              = []     # set(string) | computed

}

