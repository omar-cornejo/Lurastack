# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_fms_resource_set                                │
# └──────────────────────────────────────────────────────────────┘
resource "aws_fms_resource_set" "this" {

  tags     = {}     # map(string) | optional

  # arn      = ""     # string | computed
  # id       = ""     # string | computed
  # tags_all = {}     # map(string) | computed

  resource_set { # list
    name                = ""     # string | required
    description         = ""     # string | optional
    resource_set_status = ""     # string | optional+computed
    resource_type_list  = []     # list(string) | optional
    update_token        = ""     # string | optional+computed

    # id                  = ""     # string | computed
    # last_update_time    = ""     # string | computed

  }

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    delete = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    update = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}

