# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_budgets_budget                                      │
# └──────────────────────────────────────────────────────────────┘
data "aws_budgets_budget" "this" {

  name              = ""     # string | required
  account_id        = ""     # string | optional+computed
  id                = ""     # string | optional+computed
  name_prefix       = ""     # string | optional
  tags              = {}     # map(string) | optional+computed

  # arn               = ""     # string | computed
  # auto_adjust_data = [  # list(object)
  #   {
  #     auto_adjust_type = ""
  #     historical_options = [  # list(object)
  #       {
  #         budget_adjustment_period = 0
  #         lookback_available_periods = 0
  #       }
  #     ]
  #     last_auto_adjust_time = ""
  #   }
  # ]
  # budget_exceeded   = false  # bool | computed
  # budget_limit = [  # list(object)
  #   {
  #     amount = ""
  #     unit = ""
  #   }
  # ]
  # budget_type       = ""     # string | computed
  # calculated_spend = [  # list(object)
  #   {
  #     actual_spend = [  # list(object)
  #       {
  #         amount = ""
  #         unit = ""
  #       }
  #     ]
  #   }
  # ]
  # cost_filter = [  # set(object)
  #   {
  #     name = ""
  #     values = []  # list(string)
  #   }
  # ]
  # cost_types = [  # list(object)
  #   {
  #     include_credit = false
  #     include_discount = false
  #     include_other_subscription = false
  #     include_recurring = false
  #     include_refund = false
  #     include_subscription = false
  #     include_support = false
  #     include_tax = false
  #     include_upfront = false
  #     use_amortized = false
  #     use_blended = false
  #   }
  # ]
  # notification = [  # set(object)
  #   {
  #     comparison_operator = ""
  #     notification_type = ""
  #     subscriber_email_addresses = []  # set(string)
  #     subscriber_sns_topic_arns = []  # set(string)
  #     threshold = 0
  #     threshold_type = ""
  #   }
  # ]
  # planned_limit = [  # set(object)
  #   {
  #     amount = ""
  #     start_time = ""
  #     unit = ""
  #   }
  # ]
  # time_period_end   = ""     # string | computed
  # time_period_start = ""     # string | computed
  # time_unit         = ""     # string | computed

}

