# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ec2_subnet_cidr_reservation                     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ec2_subnet_cidr_reservation" "this" {

  cidr_block       = ""     # string | required
  reservation_type = ""     # string | required
  subnet_id        = ""     # string | required
  description      = ""     # string | optional
  id               = ""     # string | optional+computed

  # owner_id         = ""     # string | computed

}

