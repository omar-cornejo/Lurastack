# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_vpc_ipam_organization_admin_account             │
# └──────────────────────────────────────────────────────────────┘
resource "aws_vpc_ipam_organization_admin_account" "this" {

  delegated_admin_account_id = ""     # string | required
  id                         = ""     # string | optional+computed

  # arn                        = ""     # string | computed
  # email                      = ""     # string | computed
  # name                       = ""     # string | computed
  # service_principal          = ""     # string | computed

}

