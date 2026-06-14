# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_codecatalyst_dev_environment                    │
# └──────────────────────────────────────────────────────────────┘
resource "aws_codecatalyst_dev_environment" "this" {

  instance_type              = ""     # string | required
  project_name               = ""     # string | required
  space_name                 = ""     # string | required
  alias                      = ""     # string | optional
  id                         = ""     # string | optional+computed
  inactivity_timeout_minutes = 0      # number | optional

  ides { # list [1..1]
    name    = ""     # string | optional
    runtime = ""     # string | optional

  }

  persistent_storage { # list [1..1]
    size = 0      # number | required

  }

  repositories { # list [0..100]
    repository_name = ""     # string | required
    branch_name     = ""     # string | optional

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

