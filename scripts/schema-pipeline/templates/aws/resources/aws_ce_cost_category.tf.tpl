# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ce_cost_category                                │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ce_cost_category" "this" {

  name            = ""     # string | required
  rule_version    = ""     # string | required
  default_value   = ""     # string | optional
  effective_start = ""     # string | optional+computed
  id              = ""     # string | optional+computed
  tags            = {}     # map(string) | optional
  tags_all        = {}     # map(string) | optional+computed

  # arn             = ""     # string | computed
  # effective_end   = ""     # string | computed

  rule { # list [1..*]
    type  = ""     # string | optional
    value = ""     # string | optional

    inherited_value { # list [0..1]
      dimension_key  = ""     # string | optional
      dimension_name = ""     # string | optional

    }

    rule { # list [0..1]

      and { # set

        and { # set

          cost_category { # list [0..1]
            key           = ""     # string | optional
            match_options = []     # set(string) | optional
            values        = []     # set(string) | optional

          }

          dimension { # list [0..1]
            key           = ""     # string | optional
            match_options = []     # set(string) | optional
            values        = []     # set(string) | optional

          }

          tags { # list [0..1]
            key           = ""     # string | optional
            match_options = []     # set(string) | optional
            values        = []     # set(string) | optional

          }

        }

        cost_category { # list [0..1]
          key           = ""     # string | optional
          match_options = []     # set(string) | optional
          values        = []     # set(string) | optional

        }

        dimension { # list [0..1]
          key           = ""     # string | optional
          match_options = []     # set(string) | optional
          values        = []     # set(string) | optional

        }

        not { # list [0..1]

          cost_category { # list [0..1]
            key           = ""     # string | optional
            match_options = []     # set(string) | optional
            values        = []     # set(string) | optional

          }

          dimension { # list [0..1]
            key           = ""     # string | optional
            match_options = []     # set(string) | optional
            values        = []     # set(string) | optional

          }

          tags { # list [0..1]
            key           = ""     # string | optional
            match_options = []     # set(string) | optional
            values        = []     # set(string) | optional

          }

        }

        or { # set

          cost_category { # list [0..1]
            key           = ""     # string | optional
            match_options = []     # set(string) | optional
            values        = []     # set(string) | optional

          }

          dimension { # list [0..1]
            key           = ""     # string | optional
            match_options = []     # set(string) | optional
            values        = []     # set(string) | optional

          }

          tags { # list [0..1]
            key           = ""     # string | optional
            match_options = []     # set(string) | optional
            values        = []     # set(string) | optional

          }

        }

        tags { # list [0..1]
          key           = ""     # string | optional
          match_options = []     # set(string) | optional
          values        = []     # set(string) | optional

        }

      }

      cost_category { # list [0..1]
        key           = ""     # string | optional
        match_options = []     # set(string) | optional
        values        = []     # set(string) | optional

      }

      dimension { # list [0..1]
        key           = ""     # string | optional
        match_options = []     # set(string) | optional
        values        = []     # set(string) | optional

      }

      not { # list [0..1]

        and { # set

          cost_category { # list [0..1]
            key           = ""     # string | optional
            match_options = []     # set(string) | optional
            values        = []     # set(string) | optional

          }

          dimension { # list [0..1]
            key           = ""     # string | optional
            match_options = []     # set(string) | optional
            values        = []     # set(string) | optional

          }

          tags { # list [0..1]
            key           = ""     # string | optional
            match_options = []     # set(string) | optional
            values        = []     # set(string) | optional

          }

        }

        cost_category { # list [0..1]
          key           = ""     # string | optional
          match_options = []     # set(string) | optional
          values        = []     # set(string) | optional

        }

        dimension { # list [0..1]
          key           = ""     # string | optional
          match_options = []     # set(string) | optional
          values        = []     # set(string) | optional

        }

        not { # list [0..1]

          cost_category { # list [0..1]
            key           = ""     # string | optional
            match_options = []     # set(string) | optional
            values        = []     # set(string) | optional

          }

          dimension { # list [0..1]
            key           = ""     # string | optional
            match_options = []     # set(string) | optional
            values        = []     # set(string) | optional

          }

          tags { # list [0..1]
            key           = ""     # string | optional
            match_options = []     # set(string) | optional
            values        = []     # set(string) | optional

          }

        }

        or { # set

          cost_category { # list [0..1]
            key           = ""     # string | optional
            match_options = []     # set(string) | optional
            values        = []     # set(string) | optional

          }

          dimension { # list [0..1]
            key           = ""     # string | optional
            match_options = []     # set(string) | optional
            values        = []     # set(string) | optional

          }

          tags { # list [0..1]
            key           = ""     # string | optional
            match_options = []     # set(string) | optional
            values        = []     # set(string) | optional

          }

        }

        tags { # list [0..1]
          key           = ""     # string | optional
          match_options = []     # set(string) | optional
          values        = []     # set(string) | optional

        }

      }

      or { # set

        and { # set

          cost_category { # list [0..1]
            key           = ""     # string | optional
            match_options = []     # set(string) | optional
            values        = []     # set(string) | optional

          }

          dimension { # list [0..1]
            key           = ""     # string | optional
            match_options = []     # set(string) | optional
            values        = []     # set(string) | optional

          }

          tags { # list [0..1]
            key           = ""     # string | optional
            match_options = []     # set(string) | optional
            values        = []     # set(string) | optional

          }

        }

        cost_category { # list [0..1]
          key           = ""     # string | optional
          match_options = []     # set(string) | optional
          values        = []     # set(string) | optional

        }

        dimension { # list [0..1]
          key           = ""     # string | optional
          match_options = []     # set(string) | optional
          values        = []     # set(string) | optional

        }

        not { # list [0..1]

          cost_category { # list [0..1]
            key           = ""     # string | optional
            match_options = []     # set(string) | optional
            values        = []     # set(string) | optional

          }

          dimension { # list [0..1]
            key           = ""     # string | optional
            match_options = []     # set(string) | optional
            values        = []     # set(string) | optional

          }

          tags { # list [0..1]
            key           = ""     # string | optional
            match_options = []     # set(string) | optional
            values        = []     # set(string) | optional

          }

        }

        or { # set

          cost_category { # list [0..1]
            key           = ""     # string | optional
            match_options = []     # set(string) | optional
            values        = []     # set(string) | optional

          }

          dimension { # list [0..1]
            key           = ""     # string | optional
            match_options = []     # set(string) | optional
            values        = []     # set(string) | optional

          }

          tags { # list [0..1]
            key           = ""     # string | optional
            match_options = []     # set(string) | optional
            values        = []     # set(string) | optional

          }

        }

        tags { # list [0..1]
          key           = ""     # string | optional
          match_options = []     # set(string) | optional
          values        = []     # set(string) | optional

        }

      }

      tags { # list [0..1]
        key           = ""     # string | optional
        match_options = []     # set(string) | optional
        values        = []     # set(string) | optional

      }

    }

  }

  split_charge_rule { # set
    method  = ""     # string | required
    source  = ""     # string | required
    targets = []     # set(string) | required

    parameter { # set
      type   = ""     # string | optional
      values = []     # list(string) | optional

    }

  }

}

