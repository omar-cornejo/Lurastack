# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_eks_cluster_auth                                    │
# └──────────────────────────────────────────────────────────────┘
data "aws_eks_cluster_auth" "this" {

  name  = ""     # string | required
  id    = ""     # string | optional+computed

  # token = ""     # string | computed+sensitive

}

