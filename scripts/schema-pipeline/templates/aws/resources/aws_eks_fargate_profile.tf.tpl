# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_eks_fargate_profile                             │
# └──────────────────────────────────────────────────────────────┘
resource "aws_eks_fargate_profile" "this" {

  cluster_name           = ""     # string | required
  fargate_profile_name   = ""     # string | required
  pod_execution_role_arn = ""     # string | required
  id                     = ""     # string | optional+computed
  subnet_ids             = []     # set(string) | optional
  tags                   = {}     # map(string) | optional
  tags_all               = {}     # map(string) | optional+computed

  # arn                    = ""     # string | computed
  # status                 = ""     # string | computed

  selector { # set [1..*]
    namespace = ""     # string | required
    labels    = {}     # map(string) | optional

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

