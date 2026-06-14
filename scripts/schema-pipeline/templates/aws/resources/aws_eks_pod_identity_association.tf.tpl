# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_eks_pod_identity_association                    │
# └──────────────────────────────────────────────────────────────┘
resource "aws_eks_pod_identity_association" "this" {

  cluster_name    = ""     # string | required
  namespace       = ""     # string | required
  role_arn        = ""     # string | required
  service_account = ""     # string | required
  tags            = {}     # map(string) | optional

  # association_arn = ""     # string | computed
  # association_id  = ""     # string | computed
  # id              = ""     # string | computed
  # tags_all        = {}     # map(string) | computed

}

