# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_batch_scheduling_policy                             │
# └──────────────────────────────────────────────────────────────┘
data "aws_batch_scheduling_policy" "this" {

  arn               = ""     # string | required
  id                = ""     # string | optional+computed
  tags              = {}     # map(string) | optional+computed

  # fair_share_policy = [  # list(object)
  #   {
  #     compute_reservation = 0
  #     share_decay_seconds = 0
  #     share_distribution = [  # set(object)
  #       {
  #         share_identifier = ""
  #         weight_factor = 0
  #       }
  #     ]
  #   }
  # ]
  # name              = ""     # string | computed

}

