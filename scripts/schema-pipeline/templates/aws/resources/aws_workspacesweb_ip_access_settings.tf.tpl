# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_workspacesweb_ip_access_settings                │
# └──────────────────────────────────────────────────────────────┘
resource "aws_workspacesweb_ip_access_settings" "this" {

  display_name                  = ""     # string | required
  additional_encryption_context = {}     # map(string) | optional
  customer_managed_key          = ""     # string | optional
  description                   = ""     # string | optional
  tags                          = {}     # map(string) | optional

  # associated_portal_arns        = []     # list(string) | computed
  # ip_access_settings_arn        = ""     # string | computed
  # tags_all                      = {}     # map(string) | computed

  ip_rule { # list
    ip_range    = ""     # string | required
    description = ""     # string | optional

  }

}

