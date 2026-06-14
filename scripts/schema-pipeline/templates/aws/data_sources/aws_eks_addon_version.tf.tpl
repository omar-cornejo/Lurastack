# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_eks_addon_version                                   │
# └──────────────────────────────────────────────────────────────┘
data "aws_eks_addon_version" "this" {

  addon_name         = ""     # string | required
  kubernetes_version = ""     # string | required
  id                 = ""     # string | optional+computed
  most_recent        = false  # bool | optional

  # version            = ""     # string | computed

}

