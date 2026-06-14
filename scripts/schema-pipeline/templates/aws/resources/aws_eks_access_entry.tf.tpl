# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_eks_access_entry                                │
# └──────────────────────────────────────────────────────────────┘
resource "aws_eks_access_entry" "this" {

  cluster_name      = ""     # string | required
  principal_arn     = ""     # string | required
  id                = ""     # string | optional+computed
  kubernetes_groups = []     # set(string) | optional+computed
  tags              = {}     # map(string) | optional
  tags_all          = {}     # map(string) | optional+computed
  type              = ""     # string | optional
  user_name         = ""     # string | optional+computed

  # access_entry_arn  = ""     # string | computed
  # created_at        = ""     # string | computed
  # modified_at       = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

