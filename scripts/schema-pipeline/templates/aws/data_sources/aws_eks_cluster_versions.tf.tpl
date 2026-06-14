# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_eks_cluster_versions                                │
# └──────────────────────────────────────────────────────────────┘
data "aws_eks_cluster_versions" "this" {

  cluster_type          = ""     # string | optional
  cluster_versions_only = []     # list(string) | optional
  default_only          = false  # bool | optional
  include_all           = false  # bool | optional
  version_status        = ""     # string | optional

  # cluster_versions = [  # list(object)
  #   {
  #     cluster_type = ""
  #     cluster_version = ""
  #     default_platform_version = ""
  #     default_version = false
  #     end_of_extended_support_date = ""
  #     end_of_standard_support_date = ""
  #     kubernetes_patch_version = ""
  #     release_date = ""
  #     version_status = ""
  #   }
  # ]

}

