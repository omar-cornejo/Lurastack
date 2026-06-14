# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_msk_cluster_policy                              │
# └──────────────────────────────────────────────────────────────┘
resource "aws_msk_cluster_policy" "this" {

  cluster_arn     = ""     # string | required
  policy          = ""     # string | required
  id              = ""     # string | optional+computed

  # current_version = ""     # string | computed

}

