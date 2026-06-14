# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_eks_node_groups                                     │
# └──────────────────────────────────────────────────────────────┘
data "aws_eks_node_groups" "this" {

  cluster_name = ""     # string | required
  id           = ""     # string | optional+computed

  # names        = []     # set(string) | computed

}

