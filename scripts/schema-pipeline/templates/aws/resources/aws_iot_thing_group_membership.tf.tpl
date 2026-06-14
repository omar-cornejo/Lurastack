# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_iot_thing_group_membership                      │
# └──────────────────────────────────────────────────────────────┘
resource "aws_iot_thing_group_membership" "this" {

  thing_group_name       = ""     # string | required
  thing_name             = ""     # string | required
  id                     = ""     # string | optional+computed
  override_dynamic_group = false  # bool | optional

}

