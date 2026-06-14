# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_prometheus_workspaces                               │
# └──────────────────────────────────────────────────────────────┘
data "aws_prometheus_workspaces" "this" {

  alias_prefix  = ""     # string | optional
  id            = ""     # string | optional+computed

  # aliases       = []     # list(string) | computed
  # arns          = []     # list(string) | computed
  # workspace_ids = []     # list(string) | computed

}

