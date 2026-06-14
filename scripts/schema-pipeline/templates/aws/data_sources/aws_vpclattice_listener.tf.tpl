# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_vpclattice_listener                                 │
# └──────────────────────────────────────────────────────────────┘
data "aws_vpclattice_listener" "this" {

  listener_identifier = ""     # string | required
  service_identifier  = ""     # string | required
  id                  = ""     # string | optional+computed
  tags                = {}     # map(string) | optional+computed

  # arn                 = ""     # string | computed
  # created_at          = ""     # string | computed
  # default_action = [  # list(object)
  #   {
  #     fixed_response = [  # list(object)
  #       {
  #         status_code = 0
  #       }
  #     ]
  #     forward = [  # list(object)
  #       {
  #         target_groups = [  # list(object)
  #           {
  #             target_group_identifier = ""
  #             weight = 0
  #           }
  #         ]
  #       }
  #     ]
  #   }
  # ]
  # last_updated_at     = ""     # string | computed
  # listener_id         = ""     # string | computed
  # name                = ""     # string | computed
  # port                = 0      # number | computed
  # protocol            = ""     # string | computed
  # service_arn         = ""     # string | computed
  # service_id          = ""     # string | computed

}

