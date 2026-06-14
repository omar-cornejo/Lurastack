# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_ce_tags                                             │
# └──────────────────────────────────────────────────────────────┘
data "aws_ce_tags" "this" {

  id            = ""     # string | optional+computed
  search_string = ""     # string | optional
  tag_key       = ""     # string | optional

  # tags          = []     # set(string) | computed

  filter { # list [0..1]

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

  sort_by { # list
    key        = ""     # string | optional
    sort_order = ""     # string | optional

  }

  time_period { # list [1..1]
    end   = ""     # string | required
    start = ""     # string | required

  }

}

