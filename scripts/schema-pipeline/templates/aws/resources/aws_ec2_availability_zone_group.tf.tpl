# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ec2_availability_zone_group                     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ec2_availability_zone_group" "this" {

  group_name    = ""     # string | required
  opt_in_status = ""     # string | required
  id            = ""     # string | optional+computed

}

