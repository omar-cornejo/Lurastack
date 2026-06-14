# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_ecs_cluster                                         │
# └──────────────────────────────────────────────────────────────┘
data "aws_ecs_cluster" "this" {

  cluster_name                         = ""     # string | required
  id                                   = ""     # string | optional+computed
  tags                                 = {}     # map(string) | optional+computed

  # arn                                  = ""     # string | computed
  # pending_tasks_count                  = 0      # number | computed
  # registered_container_instances_count = 0      # number | computed
  # running_tasks_count                  = 0      # number | computed
  # service_connect_defaults = [  # list(object)
  #   {
  #     namespace = ""
  #   }
  # ]
  # setting = [  # set(object)
  #   {
  #     name = ""
  #     value = ""
  #   }
  # ]
  # status                               = ""     # string | computed

}

