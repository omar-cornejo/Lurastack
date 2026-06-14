# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_eks_clusters                                        │
# └──────────────────────────────────────────────────────────────┘
data "aws_eks_clusters" "this" {

  id    = ""     # string | optional+computed

  # names = []     # set(string) | computed

}

