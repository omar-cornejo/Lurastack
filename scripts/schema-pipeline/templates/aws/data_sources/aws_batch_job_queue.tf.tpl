# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_batch_job_queue                                     │
# └──────────────────────────────────────────────────────────────┘
data "aws_batch_job_queue" "this" {

  name                        = ""     # string | required
  id                          = ""     # string | optional+computed
  tags                        = {}     # map(string) | optional+computed

  # arn                         = ""     # string | computed
  # compute_environment_order = [  # list(object)
  #   {
  #     compute_environment = ""
  #     order = 0
  #   }
  # ]
  # job_state_time_limit_action = [  # list(object)
  #   {
  #     action = ""
  #     max_time_seconds = 0
  #     reason = ""
  #     state = ""
  #   }
  # ]
  # priority                    = 0      # number | computed
  # scheduling_policy_arn       = ""     # string | computed
  # state                       = ""     # string | computed
  # status                      = ""     # string | computed
  # status_reason               = ""     # string | computed

}

