# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_lexv2models_bot                                 │
# └──────────────────────────────────────────────────────────────┘
resource "aws_lexv2models_bot" "this" {

  idle_session_ttl_in_seconds = 0      # number | required
  name                        = ""     # string | required
  role_arn                    = ""     # string | required
  description                 = ""     # string | optional
  tags                        = {}     # map(string) | optional
  test_bot_alias_tags         = {}     # map(string) | optional
  type                        = ""     # string | optional+computed

  # arn                         = ""     # string | computed
  # id                          = ""     # string | computed
  # tags_all                    = {}     # map(string) | computed

  data_privacy { # list
    child_directed = false  # bool | required

  }

  members { # list
    alias_id   = ""     # string | required
    alias_name = ""     # string | required
    id         = ""     # string | required
    name       = ""     # string | required
    version    = ""     # string | required

  }

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    delete = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    update = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}

