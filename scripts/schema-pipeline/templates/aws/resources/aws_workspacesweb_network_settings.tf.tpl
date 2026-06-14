# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_workspacesweb_network_settings                  │
# └──────────────────────────────────────────────────────────────┘
resource "aws_workspacesweb_network_settings" "this" {

  security_group_ids     = []     # set(string) | required
  subnet_ids             = []     # set(string) | required
  vpc_id                 = ""     # string | required
  tags                   = {}     # map(string) | optional

  # associated_portal_arns = []     # list(string) | computed
  # network_settings_arn   = ""     # string | computed
  # tags_all               = {}     # map(string) | computed

}

