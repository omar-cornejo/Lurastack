# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_neptune_cluster_endpoint                        │
# └──────────────────────────────────────────────────────────────┘
resource "aws_neptune_cluster_endpoint" "this" {

  cluster_endpoint_identifier = ""     # string | required
  cluster_identifier          = ""     # string | required
  endpoint_type               = ""     # string | required
  excluded_members            = []     # set(string) | optional
  id                          = ""     # string | optional+computed
  static_members              = []     # set(string) | optional
  tags                        = {}     # map(string) | optional
  tags_all                    = {}     # map(string) | optional+computed

  # arn                         = ""     # string | computed
  # endpoint                    = ""     # string | computed

}

