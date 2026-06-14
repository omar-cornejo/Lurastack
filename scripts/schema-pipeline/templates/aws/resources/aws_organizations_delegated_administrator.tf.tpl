# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_organizations_delegated_administrator           │
# └──────────────────────────────────────────────────────────────┘
resource "aws_organizations_delegated_administrator" "this" {

  account_id              = ""     # string | required
  service_principal       = ""     # string | required
  id                      = ""     # string | optional+computed

  # arn                     = ""     # string | computed
  # delegation_enabled_date = ""     # string | computed
  # email                   = ""     # string | computed
  # joined_method           = ""     # string | computed
  # joined_timestamp        = ""     # string | computed
  # name                    = ""     # string | computed
  # status                  = ""     # string | computed

}

