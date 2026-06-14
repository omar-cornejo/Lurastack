# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_backup_selection                                │
# └──────────────────────────────────────────────────────────────┘
resource "aws_backup_selection" "this" {

  iam_role_arn  = ""     # string | required
  name          = ""     # string | required
  plan_id       = ""     # string | required
  id            = ""     # string | optional+computed
  not_resources = []     # set(string) | optional+computed
  resources     = []     # set(string) | optional

  condition { # set

    string_equals { # set
      key   = ""     # string | required
      value = ""     # string | required

    }

    string_like { # set
      key   = ""     # string | required
      value = ""     # string | required

    }

    string_not_equals { # set
      key   = ""     # string | required
      value = ""     # string | required

    }

    string_not_like { # set
      key   = ""     # string | required
      value = ""     # string | required

    }

  }

  selection_tag { # set
    key   = ""     # string | required
    type  = ""     # string | required
    value = ""     # string | required

  }

}

