# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_connect_user_hierarchy_structure                │
# └──────────────────────────────────────────────────────────────┘
resource "aws_connect_user_hierarchy_structure" "this" {

  instance_id = ""     # string | required
  id          = ""     # string | optional+computed

  hierarchy_structure { # list [1..1]

    level_five { # list [0..1]
      name = ""     # string | required

      # arn  = ""     # string | computed
      # id   = ""     # string | computed

    }

    level_four { # list [0..1]
      name = ""     # string | required

      # arn  = ""     # string | computed
      # id   = ""     # string | computed

    }

    level_one { # list [0..1]
      name = ""     # string | required

      # arn  = ""     # string | computed
      # id   = ""     # string | computed

    }

    level_three { # list [0..1]
      name = ""     # string | required

      # arn  = ""     # string | computed
      # id   = ""     # string | computed

    }

    level_two { # list [0..1]
      name = ""     # string | required

      # arn  = ""     # string | computed
      # id   = ""     # string | computed

    }

  }

}

