# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_egress_only_internet_gateway                    │
# └──────────────────────────────────────────────────────────────┘
resource "aws_egress_only_internet_gateway" "this" {

  vpc_id   = ""     # string | required
  id       = ""     # string | optional+computed
  tags     = {}     # map(string) | optional
  tags_all = {}     # map(string) | optional+computed

}

