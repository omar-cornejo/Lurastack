# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_sesv2_dedicated_ip_pool                         │
# └──────────────────────────────────────────────────────────────┘
resource "aws_sesv2_dedicated_ip_pool" "this" {

  pool_name    = ""     # string | required
  id           = ""     # string | optional+computed
  scaling_mode = ""     # string | optional+computed
  tags         = {}     # map(string) | optional
  tags_all     = {}     # map(string) | optional+computed

  # arn          = ""     # string | computed

}

