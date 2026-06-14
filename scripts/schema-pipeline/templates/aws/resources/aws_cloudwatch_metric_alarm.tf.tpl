# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_cloudwatch_metric_alarm                         │
# └──────────────────────────────────────────────────────────────┘
resource "aws_cloudwatch_metric_alarm" "this" {

  alarm_name                            = ""     # string | required
  comparison_operator                   = ""     # string | required
  evaluation_periods                    = 0      # number | required
  actions_enabled                       = false  # bool | optional
  alarm_actions                         = []     # set(string) | optional
  alarm_description                     = ""     # string | optional
  datapoints_to_alarm                   = 0      # number | optional
  dimensions                            = {}     # map(string) | optional
  evaluate_low_sample_count_percentiles = ""     # string | optional+computed
  extended_statistic                    = ""     # string | optional
  id                                    = ""     # string | optional+computed
  insufficient_data_actions             = []     # set(string) | optional
  metric_name                           = ""     # string | optional
  namespace                             = ""     # string | optional
  ok_actions                            = []     # set(string) | optional
  period                                = 0      # number | optional
  statistic                             = ""     # string | optional
  tags                                  = {}     # map(string) | optional
  tags_all                              = {}     # map(string) | optional+computed
  threshold                             = 0      # number | optional
  threshold_metric_id                   = ""     # string | optional
  treat_missing_data                    = ""     # string | optional
  unit                                  = ""     # string | optional

  # arn                                   = ""     # string | computed

  metric_query { # set
    id          = ""     # string | required
    account_id  = ""     # string | optional
    expression  = ""     # string | optional
    label       = ""     # string | optional
    period      = 0      # number | optional
    return_data = false  # bool | optional

    metric { # list [0..1]
      metric_name = ""     # string | required
      period      = 0      # number | required
      stat        = ""     # string | required
      dimensions  = {}     # map(string) | optional
      namespace   = ""     # string | optional
      unit        = ""     # string | optional

    }

  }

}

