# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_redshift_orderable_cluster                          │
# └──────────────────────────────────────────────────────────────┘
data "aws_redshift_orderable_cluster" "this" {

  cluster_type         = ""     # string | optional+computed
  cluster_version      = ""     # string | optional+computed
  id                   = ""     # string | optional+computed
  node_type            = ""     # string | optional+computed
  preferred_node_types = []     # list(string) | optional

  # availability_zones   = []     # list(string) | computed

}

