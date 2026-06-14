# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_ecs_container_definition                            │
# └──────────────────────────────────────────────────────────────┘
data "aws_ecs_container_definition" "this" {

  container_name     = ""     # string | required
  task_definition    = ""     # string | required
  id                 = ""     # string | optional+computed

  # cpu                = 0      # number | computed
  # disable_networking = false  # bool | computed
  # docker_labels      = {}     # map(string) | computed
  # environment        = {}     # map(string) | computed
  # image              = ""     # string | computed
  # image_digest       = ""     # string | computed
  # memory             = 0      # number | computed
  # memory_reservation = 0      # number | computed

}

