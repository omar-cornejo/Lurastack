# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_vpclattice_service_network                      │
# └──────────────────────────────────────────────────────────────┘
resource "aws_vpclattice_service_network" "this" {

  name      = ""     # string | required
  auth_type = ""     # string | optional+computed
  id        = ""     # string | optional+computed
  tags      = {}     # map(string) | optional
  tags_all  = {}     # map(string) | optional+computed

  # arn       = ""     # string | computed

}

