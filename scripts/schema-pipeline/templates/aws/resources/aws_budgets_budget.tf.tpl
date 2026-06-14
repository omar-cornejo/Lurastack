# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_budgets_budget                                  │
# └──────────────────────────────────────────────────────────────┘
resource "aws_budgets_budget" "this" {

  budget_type       = ""     # string | required
  time_unit         = ""     # string | required
  account_id        = ""     # string | optional+computed
  id                = ""     # string | optional+computed
  limit_amount      = ""     # string | optional+computed
  limit_unit        = ""     # string | optional+computed
  name              = ""     # string | optional+computed
  name_prefix       = ""     # string | optional+computed
  tags              = {}     # map(string) | optional
  tags_all          = {}     # map(string) | optional+computed
  time_period_end   = ""     # string | optional
  time_period_start = ""     # string | optional+computed

  # arn               = ""     # string | computed

  auto_adjust_data { # list [0..1]
    auto_adjust_type      = ""     # string | required

    # last_auto_adjust_time = ""     # string | computed

    historical_options { # list [0..1]
      budget_adjustment_period   = 0      # number | required

      # lookback_available_periods = 0      # number | computed

    }

  }

  cost_filter { # set
    name   = ""     # string | required
    values = []     # list(string) | required

  }

  cost_types { # list [0..1]
    include_credit             = false  # bool | optional
    include_discount           = false  # bool | optional
    include_other_subscription = false  # bool | optional
    include_recurring          = false  # bool | optional
    include_refund             = false  # bool | optional
    include_subscription       = false  # bool | optional
    include_support            = false  # bool | optional
    include_tax                = false  # bool | optional
    include_upfront            = false  # bool | optional
    use_amortized              = false  # bool | optional
    use_blended                = false  # bool | optional

  }

  notification { # set
    comparison_operator        = ""     # string | required
    notification_type          = ""     # string | required
    threshold                  = 0      # number | required
    threshold_type             = ""     # string | required
    subscriber_email_addresses = []     # set(string) | optional
    subscriber_sns_topic_arns  = []     # set(string) | optional

  }

  planned_limit { # set
    amount     = ""     # string | required
    start_time = ""     # string | required
    unit       = ""     # string | required

  }

}

