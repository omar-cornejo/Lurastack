# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_lakeformation_resource                          │
# └──────────────────────────────────────────────────────────────┘
resource "aws_lakeformation_resource" "this" {

  arn                     = ""     # string | required
  hybrid_access_enabled   = false  # bool | optional+computed
  id                      = ""     # string | optional+computed
  role_arn                = ""     # string | optional+computed
  use_service_linked_role = false  # bool | optional
  with_federation         = false  # bool | optional+computed

  # last_modified           = ""     # string | computed

}

