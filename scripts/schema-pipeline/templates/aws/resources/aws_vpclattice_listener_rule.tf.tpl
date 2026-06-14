# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_vpclattice_listener_rule                        │
# └──────────────────────────────────────────────────────────────┘
resource "aws_vpclattice_listener_rule" "this" {

  listener_identifier = ""     # string | required
  name                = ""     # string | required
  priority            = 0      # number | required
  service_identifier  = ""     # string | required
  id                  = ""     # string | optional+computed
  tags                = {}     # map(string) | optional
  tags_all            = {}     # map(string) | optional+computed

  # arn                 = ""     # string | computed
  # rule_id             = ""     # string | computed

  action { # list [1..1]

    fixed_response { # list [0..1]
      status_code = 0      # number | required

    }

    forward { # list [0..1]

      target_groups { # list [1..*]
        target_group_identifier = ""     # string | required
        weight                  = 0      # number | optional

      }

    }

  }

  match { # list [1..1]

    http_match { # list [1..1]
      method = ""     # string | optional

      header_matches { # list [0..5]
        name           = ""     # string | required
        case_sensitive = false  # bool | optional

        match { # list [1..1]
          contains = ""     # string | optional
          exact    = ""     # string | optional
          prefix   = ""     # string | optional

        }

      }

      path_match { # list [0..1]
        case_sensitive = false  # bool | optional

        match { # list [1..1]
          exact  = ""     # string | optional
          prefix = ""     # string | optional

        }

      }

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

