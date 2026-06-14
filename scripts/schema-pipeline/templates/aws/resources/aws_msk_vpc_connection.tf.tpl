# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_msk_vpc_connection                              │
# └──────────────────────────────────────────────────────────────┘
resource "aws_msk_vpc_connection" "this" {

  authentication     = ""     # string | required
  client_subnets     = []     # set(string) | required
  security_groups    = []     # set(string) | required
  target_cluster_arn = ""     # string | required
  vpc_id             = ""     # string | required
  id                 = ""     # string | optional+computed
  tags               = {}     # map(string) | optional
  tags_all           = {}     # map(string) | optional+computed

  # arn                = ""     # string | computed

}

