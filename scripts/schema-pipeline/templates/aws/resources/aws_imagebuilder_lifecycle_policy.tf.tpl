# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_imagebuilder_lifecycle_policy                   │
# └──────────────────────────────────────────────────────────────┘
resource "aws_imagebuilder_lifecycle_policy" "this" {

  execution_role = ""     # string | required
  name           = ""     # string | required
  resource_type  = ""     # string | required
  description    = ""     # string | optional
  status         = ""     # string | optional+computed
  tags           = {}     # map(string) | optional

  # arn            = ""     # string | computed
  # id             = ""     # string | computed
  # tags_all       = {}     # map(string) | computed

  policy_detail { # set

    action { # list
      type = ""     # string | required

      include_resources { # list
        amis       = false  # bool | optional+computed
        containers = false  # bool | optional+computed
        snapshots  = false  # bool | optional+computed

      }

    }

    exclusion_rules { # list
      tag_map = {}     # map(string) | optional

      amis { # list
        is_public       = false  # bool | optional
        regions         = []     # list(string) | optional
        shared_accounts = []     # list(string) | optional
        tag_map         = {}     # map(string) | optional

        last_launched { # list
          unit  = ""     # string | required
          value = 0      # number | required

        }

      }

    }

    filter { # list
      type            = ""     # string | required
      value           = 0      # number | required
      retain_at_least = 0      # number | optional
      unit            = ""     # string | optional

    }

  }

  resource_selection { # list
    tag_map = {}     # map(string) | optional

    recipe { # set
      name             = ""     # string | required
      semantic_version = ""     # string | required

    }

  }

}

