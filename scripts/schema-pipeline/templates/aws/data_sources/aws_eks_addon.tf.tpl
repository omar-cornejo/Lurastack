# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_eks_addon                                           │
# └──────────────────────────────────────────────────────────────┘
data "aws_eks_addon" "this" {

  addon_name               = ""     # string | required
  cluster_name             = ""     # string | required
  id                       = ""     # string | optional+computed
  tags                     = {}     # map(string) | optional+computed

  # addon_version            = ""     # string | computed
  # arn                      = ""     # string | computed
  # configuration_values     = ""     # string | computed
  # created_at               = ""     # string | computed
  # modified_at              = ""     # string | computed
  # pod_identity_association = [  # set(object)
  #   {
  #     role_arn = ""
  #     service_account = ""
  #   }
  # ]
  # service_account_role_arn = ""     # string | computed

}

