# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_resourcegroups_group                            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_resourcegroups_group" "this" {

  name        = ""     # string | required
  description = ""     # string | optional
  id          = ""     # string | optional+computed
  tags        = {}     # map(string) | optional
  tags_all    = {}     # map(string) | optional+computed

  # arn         = ""     # string | computed

  configuration { # set
    type = ""     # string | required

    parameters { # set
      name   = ""     # string | required
      values = []     # list(string) | required

    }

  }

  resource_query { # list [0..1]
    query = ""     # string | required
    type  = ""     # string | optional

  }

  timeouts { # single
    create = ""     # string | optional
    update = ""     # string | optional

  }

}

