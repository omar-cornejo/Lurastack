# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_ssmcontacts_plan                                    │
# └──────────────────────────────────────────────────────────────┘
data "aws_ssmcontacts_plan" "this" {

  contact_id = ""     # string | required
  id         = ""     # string | optional+computed

  # stage = [  # list(object)
  #   {
  #     duration_in_minutes = 0
  #     target = [  # list(object)
  #       {
  #         channel_target_info = [  # list(object)
  #           {
  #             contact_channel_id = ""
  #             retry_interval_in_minutes = 0
  #           }
  #         ]
  #         contact_target_info = [  # list(object)
  #           {
  #             contact_id = ""
  #             is_essential = false
  #           }
  #         ]
  #       }
  #     ]
  #   }
  # ]

}

