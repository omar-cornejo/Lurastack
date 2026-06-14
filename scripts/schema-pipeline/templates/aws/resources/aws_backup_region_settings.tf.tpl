# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_backup_region_settings                          │
# └──────────────────────────────────────────────────────────────┘
resource "aws_backup_region_settings" "this" {

  resource_type_opt_in_preference     = {}     # map(bool) | required
  id                                  = ""     # string | optional+computed
  resource_type_management_preference = {}     # map(bool) | optional+computed

}

