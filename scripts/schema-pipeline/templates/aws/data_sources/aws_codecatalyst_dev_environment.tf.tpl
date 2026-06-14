# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_codecatalyst_dev_environment                        │
# └──────────────────────────────────────────────────────────────┘
data "aws_codecatalyst_dev_environment" "this" {

  env_id                     = ""     # string | required
  project_name               = ""     # string | required
  space_name                 = ""     # string | required
  alias                      = ""     # string | optional
  creator_id                 = ""     # string | optional
  id                         = ""     # string | optional+computed
  tags                       = {}     # map(string) | optional+computed

  # ides = [  # list(object)
  #   {
  #     name = ""
  #     runtime = ""
  #   }
  # ]
  # inactivity_timeout_minutes = 0      # number | computed
  # instance_type              = ""     # string | computed
  # last_updated_time          = ""     # string | computed
  # persistent_storage = [  # list(object)
  #   {
  #     size = 0
  #   }
  # ]
  # status                     = ""     # string | computed
  # status_reason              = ""     # string | computed

  repositories { # list [0..100]

    # branch_name     = ""     # string | computed
    # repository_name = ""     # string | computed

  }

}

