# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_resourceexplorer2_view                          │
# └──────────────────────────────────────────────────────────────┘
resource "aws_resourceexplorer2_view" "this" {

  name         = ""     # string | required
  default_view = false  # bool | optional+computed
  scope        = ""     # string | optional+computed
  tags         = {}     # map(string) | optional

  # arn          = ""     # string | computed
  # id           = ""     # string | computed
  # tags_all     = {}     # map(string) | computed

  filters { # list
    filter_string = ""     # string | required

  }

  included_property { # list
    name = ""     # string | required

  }

}

