# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_batch_compute_environment                           │
# └──────────────────────────────────────────────────────────────┘
data "aws_batch_compute_environment" "this" {

  compute_environment_name = ""     # string | required
  id                       = ""     # string | optional+computed
  tags                     = {}     # map(string) | optional+computed

  # arn                      = ""     # string | computed
  # ecs_cluster_arn          = ""     # string | computed
  # service_role             = ""     # string | computed
  # state                    = ""     # string | computed
  # status                   = ""     # string | computed
  # status_reason            = ""     # string | computed
  # type                     = ""     # string | computed
  # update_policy = [  # list(object)
  #   {
  #     job_execution_timeout_minutes = 0
  #     terminate_jobs_on_update = false
  #   }
  # ]

}

