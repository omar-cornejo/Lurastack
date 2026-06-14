# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ce_anomaly_subscription                         │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ce_anomaly_subscription" "this" {

  frequency        = ""     # string | required
  monitor_arn_list = []     # list(string) | required
  name             = ""     # string | required
  account_id       = ""     # string | optional+computed
  id               = ""     # string | optional+computed
  tags             = {}     # map(string) | optional
  tags_all         = {}     # map(string) | optional+computed

  # arn              = ""     # string | computed

  subscriber { # set [1..*]
    address = ""     # string | required
    type    = ""     # string | required

  }

  threshold_expression { # list [0..1]

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

}

