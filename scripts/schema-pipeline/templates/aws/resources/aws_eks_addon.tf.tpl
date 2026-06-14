# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_eks_addon                                       │
# └──────────────────────────────────────────────────────────────┘
resource "aws_eks_addon" "this" {

  addon_name                  = ""     # string | required
  cluster_name                = ""     # string | required
  addon_version               = ""     # string | optional+computed
  configuration_values        = ""     # string | optional+computed
  id                          = ""     # string | optional+computed
  preserve                    = false  # bool | optional
  resolve_conflicts           = ""     # string | optional+DEPRECATED
  resolve_conflicts_on_create = ""     # string | optional
  resolve_conflicts_on_update = ""     # string | optional
  service_account_role_arn    = ""     # string | optional
  tags                        = {}     # map(string) | optional
  tags_all                    = {}     # map(string) | optional+computed

  # arn                         = ""     # string | computed
  # created_at                  = ""     # string | computed
  # modified_at                 = ""     # string | computed

  pod_identity_association { # set
    role_arn        = ""     # string | required
    service_account = ""     # string | required

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

