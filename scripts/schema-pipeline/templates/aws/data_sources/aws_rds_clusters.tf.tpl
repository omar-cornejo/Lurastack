# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_rds_clusters                                        │
# └──────────────────────────────────────────────────────────────┘
data "aws_rds_clusters" "this" {

  id                  = ""     # string | optional+computed

  # cluster_arns        = []     # set(string) | computed
  # cluster_identifiers = []     # set(string) | computed

  filter { # set
    name   = ""     # string | required
    values = []     # set(string) | required

  }

}

