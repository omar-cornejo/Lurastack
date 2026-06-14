# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_connect_quick_connect                               │
# └──────────────────────────────────────────────────────────────┘
data "aws_connect_quick_connect" "this" {

  instance_id          = ""     # string | required
  id                   = ""     # string | optional+computed
  name                 = ""     # string | optional+computed
  quick_connect_id     = ""     # string | optional+computed
  tags                 = {}     # map(string) | optional+computed

  # arn                  = ""     # string | computed
  # description          = ""     # string | computed
  # quick_connect_config = [  # list(object)
  #   {
  #     phone_config = [  # list(object)
  #       {
  #         phone_number = ""
  #       }
  #     ]
  #     queue_config = [  # list(object)
  #       {
  #         contact_flow_id = ""
  #         queue_id = ""
  #       }
  #     ]
  #     quick_connect_type = ""
  #     user_config = [  # list(object)
  #       {
  #         contact_flow_id = ""
  #         user_id = ""
  #       }
  #     ]
  #   }
  # ]

}

