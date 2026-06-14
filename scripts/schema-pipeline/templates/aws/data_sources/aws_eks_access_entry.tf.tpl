# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_eks_access_entry                                    │
# └──────────────────────────────────────────────────────────────┘
data "aws_eks_access_entry" "this" {

  cluster_name      = ""     # string | required
  principal_arn     = ""     # string | required
  id                = ""     # string | optional+computed
  tags              = {}     # map(string) | optional
  tags_all          = {}     # map(string) | optional+computed

  # access_entry_arn  = ""     # string | computed
  # created_at        = ""     # string | computed
  # kubernetes_groups = []     # set(string) | computed
  # modified_at       = ""     # string | computed
  # type              = ""     # string | computed
  # user_name         = ""     # string | computed

}

