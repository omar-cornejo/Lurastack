# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_ecs_service                                         │
# └──────────────────────────────────────────────────────────────┘
data "aws_ecs_service" "this" {

  cluster_arn                   = ""     # string | required
  service_name                  = ""     # string | required
  id                            = ""     # string | optional+computed
  tags                          = {}     # map(string) | optional+computed

  # arn                           = ""     # string | computed
  # availability_zone_rebalancing = ""     # string | computed
  # desired_count                 = 0      # number | computed
  # launch_type                   = ""     # string | computed
  # scheduling_strategy           = ""     # string | computed
  # task_definition               = ""     # string | computed

}

