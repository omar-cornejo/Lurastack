# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_appconfig_extension_association                 │
# └──────────────────────────────────────────────────────────────┘
resource "aws_appconfig_extension_association" "this" {

  extension_arn     = ""     # string | required
  resource_arn      = ""     # string | required
  id                = ""     # string | optional+computed
  parameters        = {}     # map(string) | optional

  # arn               = ""     # string | computed
  # extension_version = 0      # number | computed

}

