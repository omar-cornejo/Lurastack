# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ssmcontacts_rotation                            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ssmcontacts_rotation" "this" {

  contact_ids  = []     # list(string) | required
  name         = ""     # string | required
  time_zone_id = ""     # string | required
  start_time   = ""     # string | optional
  tags         = {}     # map(string) | optional

  # arn          = ""     # string | computed
  # id           = ""     # string | computed
  # tags_all     = {}     # map(string) | computed

  recurrence { # list
    number_of_on_calls    = 0      # number | required
    recurrence_multiplier = 0      # number | required

    daily_settings { # list
      hour_of_day    = 0      # number | required
      minute_of_hour = 0      # number | required

    }

    monthly_settings { # list
      day_of_month = 0      # number | required

      hand_off_time { # list
        hour_of_day    = 0      # number | required
        minute_of_hour = 0      # number | required

      }

    }

    shift_coverages { # list
      map_block_key = ""     # string | required

      coverage_times { # list

        end { # list
          hour_of_day    = 0      # number | required
          minute_of_hour = 0      # number | required

        }

        start { # list
          hour_of_day    = 0      # number | required
          minute_of_hour = 0      # number | required

        }

      }

    }

    weekly_settings { # list
      day_of_week = ""     # string | required

      hand_off_time { # list
        hour_of_day    = 0      # number | required
        minute_of_hour = 0      # number | required

      }

    }

  }

}

