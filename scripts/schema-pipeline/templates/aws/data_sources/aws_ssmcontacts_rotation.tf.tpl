# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_ssmcontacts_rotation                                │
# └──────────────────────────────────────────────────────────────┘
data "aws_ssmcontacts_rotation" "this" {

  arn          = ""     # string | required

  # contact_ids  = []     # list(string) | computed
  # id           = ""     # string | computed
  # name         = ""     # string | computed
  # recurrence = [  # list(object)
  #   {
  #     daily_settings = [  # list(object)
  #       {
  #         hour_of_day = 0
  #         minute_of_hour = 0
  #       }
  #     ]
  #     monthly_settings = [  # list(object)
  #       {
  #         day_of_month = 0
  #         hand_off_time = [  # list(object)
  #           {
  #             hour_of_day = 0
  #             minute_of_hour = 0
  #           }
  #         ]
  #       }
  #     ]
  #     number_of_on_calls = 0
  #     recurrence_multiplier = 0
  #     shift_coverages = [  # list(object)
  #       {
  #         coverage_times = [  # list(object)
  #           {
  #             end = [  # list(object)
  #               {
  #                 hour_of_day = 0
  #                 minute_of_hour = 0
  #               }
  #             ]
  #             start = [  # list(object)
  #               {
  #                 hour_of_day = 0
  #                 minute_of_hour = 0
  #               }
  #             ]
  #           }
  #         ]
  #         map_block_key = ""
  #       }
  #     ]
  #     weekly_settings = [  # list(object)
  #       {
  #         day_of_week = ""
  #         hand_off_time = [  # list(object)
  #           {
  #             hour_of_day = 0
  #             minute_of_hour = 0
  #           }
  #         ]
  #       }
  #     ]
  #   }
  # ]
  # start_time   = ""     # string | computed
  # tags         = {}     # map(string) | computed
  # time_zone_id = ""     # string | computed

}

