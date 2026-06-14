# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_connect_hours_of_operation                          │
# └──────────────────────────────────────────────────────────────┘
data "aws_connect_hours_of_operation" "this" {

  instance_id           = ""     # string | required
  hours_of_operation_id = ""     # string | optional+computed
  id                    = ""     # string | optional+computed
  name                  = ""     # string | optional+computed
  tags                  = {}     # map(string) | optional+computed

  # arn                   = ""     # string | computed
  # config = [  # set(object)
  #   {
  #     day = ""
  #     end_time = [  # list(object)
  #       {
  #         hours = 0
  #         minutes = 0
  #       }
  #     ]
  #     start_time = [  # list(object)
  #       {
  #         hours = 0
  #         minutes = 0
  #       }
  #     ]
  #   }
  # ]
  # description           = ""     # string | computed
  # time_zone             = ""     # string | computed

}

