# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_quicksight_refresh_schedule                     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_quicksight_refresh_schedule" "this" {

  data_set_id    = ""     # string | required
  schedule_id    = ""     # string | required
  aws_account_id = ""     # string | optional+computed

  # arn            = ""     # string | computed
  # id             = ""     # string | computed

  schedule { # list
    refresh_type          = ""     # string | required
    start_after_date_time = ""     # string | optional+computed

    schedule_frequency { # list
      interval        = ""     # string | required
      time_of_the_day = ""     # string | optional+computed
      timezone        = ""     # string | optional+computed

      refresh_on_day { # list
        day_of_month = ""     # string | optional
        day_of_week  = ""     # string | optional

      }

    }

  }

}

