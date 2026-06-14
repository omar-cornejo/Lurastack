# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_eks_access_policy_association                   │
# └──────────────────────────────────────────────────────────────┘
resource "aws_eks_access_policy_association" "this" {

  cluster_name  = ""     # string | required
  policy_arn    = ""     # string | required
  principal_arn = ""     # string | required
  id            = ""     # string | optional+computed

  # associated_at = ""     # string | computed
  # modified_at   = ""     # string | computed

  access_scope { # list [1..1]
    type       = ""     # string | required
    namespaces = []     # set(string) | optional

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

