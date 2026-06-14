# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_m2_environment                                  │
# └──────────────────────────────────────────────────────────────┘
resource "aws_m2_environment" "this" {

  engine_type                             = ""     # string | required
  instance_type                           = ""     # string | required
  name                                    = ""     # string | required
  apply_changes_during_maintenance_window = false  # bool | optional
  description                             = ""     # string | optional
  engine_version                          = ""     # string | optional+computed
  force_update                            = false  # bool | optional
  kms_key_id                              = ""     # string | optional
  preferred_maintenance_window            = ""     # string | optional+computed
  publicly_accessible                     = false  # bool | optional+computed
  security_group_ids                      = []     # set(string) | optional+computed
  subnet_ids                              = []     # set(string) | optional+computed
  tags                                    = {}     # map(string) | optional

  # arn                                     = ""     # string | computed
  # environment_id                          = ""     # string | computed
  # id                                      = ""     # string | computed
  # load_balancer_arn                       = ""     # string | computed
  # tags_all                                = {}     # map(string) | computed

  high_availability_config { # list
    desired_capacity = 0      # number | required

  }

  storage_configuration { # list

    efs { # list
      file_system_id = ""     # string | required
      mount_point    = ""     # string | required

    }

    fsx { # list
      file_system_id = ""     # string | required
      mount_point    = ""     # string | required

    }

  }

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    delete = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    update = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}

