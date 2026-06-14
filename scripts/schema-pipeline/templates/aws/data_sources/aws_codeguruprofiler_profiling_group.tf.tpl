# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_codeguruprofiler_profiling_group                    │
# └──────────────────────────────────────────────────────────────┘
data "aws_codeguruprofiler_profiling_group" "this" {

  name                       = ""     # string | required

  # agent_orchestration_config = [  # list(object)
  #   {
  #     profiling_enabled = false
  #   }
  # ]
  # arn                        = ""     # string | computed
  # compute_platform           = ""     # string | computed
  # created_at                 = ""     # string | computed
  # id                         = ""     # string | computed
  # profiling_status = [  # list(object)
  #   {
  #     latest_agent_orchestrated_at = ""
  #     latest_agent_profile_reported_at = ""
  #     latest_aggregated_profile = [  # list(object)
  #       {
  #         period = ""
  #         start = ""
  #       }
  #     ]
  #   }
  # ]
  # tags                       = {}     # map(string) | computed
  # updated_at                 = ""     # string | computed

}

