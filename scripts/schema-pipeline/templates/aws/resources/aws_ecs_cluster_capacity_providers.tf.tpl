# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ecs_cluster_capacity_providers                  │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ecs_cluster_capacity_providers" "this" {

  cluster_name       = ""     # string | required
  capacity_providers = []     # set(string) | optional
  id                 = ""     # string | optional+computed

  default_capacity_provider_strategy { # set
    capacity_provider = ""     # string | required
    base              = 0      # number | optional
    weight            = 0      # number | optional

  }

}

