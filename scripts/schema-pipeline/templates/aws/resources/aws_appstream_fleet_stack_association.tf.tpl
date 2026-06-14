# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_appstream_fleet_stack_association               │
# └──────────────────────────────────────────────────────────────┘
resource "aws_appstream_fleet_stack_association" "this" {

  fleet_name = ""     # string | required
  stack_name = ""     # string | required
  id         = ""     # string | optional+computed

}

