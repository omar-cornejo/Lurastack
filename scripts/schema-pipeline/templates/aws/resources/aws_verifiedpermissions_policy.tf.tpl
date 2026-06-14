# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_verifiedpermissions_policy                      │
# └──────────────────────────────────────────────────────────────┘
resource "aws_verifiedpermissions_policy" "this" {

  policy_store_id = ""     # string | required

  # created_date    = ""     # string | computed
  # id              = ""     # string | computed
  # policy_id       = ""     # string | computed

  definition { # list

    static { # list
      statement   = ""     # string | required
      description = ""     # string | optional

    }

    template_linked { # list
      policy_template_id = ""     # string | required

      principal { # list
        entity_id   = ""     # string | required
        entity_type = ""     # string | required

      }

      resource { # list
        entity_id   = ""     # string | required
        entity_type = ""     # string | required

      }

    }

  }

}

