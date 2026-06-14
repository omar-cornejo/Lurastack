# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ec2_carrier_gateway                             │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ec2_carrier_gateway" "this" {

  vpc_id   = ""     # string | required
  id       = ""     # string | optional+computed
  tags     = {}     # map(string) | optional
  tags_all = {}     # map(string) | optional+computed

  # arn      = ""     # string | computed
  # owner_id = ""     # string | computed

}

