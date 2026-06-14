# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_licensemanager_license_configuration            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_licensemanager_license_configuration" "this" {

  license_counting_type    = ""     # string | required
  name                     = ""     # string | required
  description              = ""     # string | optional
  id                       = ""     # string | optional+computed
  license_count            = 0      # number | optional
  license_count_hard_limit = false  # bool | optional
  license_rules            = []     # list(string) | optional
  tags                     = {}     # map(string) | optional
  tags_all                 = {}     # map(string) | optional+computed

  # arn                      = ""     # string | computed
  # owner_account_id         = ""     # string | computed

}

