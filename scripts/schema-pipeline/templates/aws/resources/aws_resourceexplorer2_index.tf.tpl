# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_resourceexplorer2_index                         │
# └──────────────────────────────────────────────────────────────┘
resource "aws_resourceexplorer2_index" "this" {

  type     = ""     # string | required
  tags     = {}     # map(string) | optional

  # arn      = ""     # string | computed
  # id       = ""     # string | computed
  # tags_all = {}     # map(string) | computed

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    delete = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    update = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}

