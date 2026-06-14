# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_workspacesweb_browser_settings                  │
# └──────────────────────────────────────────────────────────────┘
resource "aws_workspacesweb_browser_settings" "this" {

  browser_policy                = ""     # string | required
  additional_encryption_context = {}     # map(string) | optional
  customer_managed_key          = ""     # string | optional
  tags                          = {}     # map(string) | optional

  # associated_portal_arns        = []     # list(string) | computed
  # browser_settings_arn          = ""     # string | computed
  # tags_all                      = {}     # map(string) | computed

}

