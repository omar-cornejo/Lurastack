# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_dsql_cluster_peering                            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_dsql_cluster_peering" "this" {

  clusters       = []     # set(string) | required
  identifier     = ""     # string | required
  witness_region = ""     # string | required

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}

