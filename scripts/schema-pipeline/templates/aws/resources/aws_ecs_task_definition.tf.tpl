# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ecs_task_definition                             │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ecs_task_definition" "this" {

  container_definitions    = ""     # string | required
  family                   = ""     # string | required
  cpu                      = ""     # string | optional
  enable_fault_injection   = false  # bool | optional+computed
  execution_role_arn       = ""     # string | optional
  id                       = ""     # string | optional+computed
  ipc_mode                 = ""     # string | optional
  memory                   = ""     # string | optional
  network_mode             = ""     # string | optional+computed
  pid_mode                 = ""     # string | optional
  requires_compatibilities = []     # set(string) | optional
  skip_destroy             = false  # bool | optional
  tags                     = {}     # map(string) | optional
  tags_all                 = {}     # map(string) | optional+computed
  task_role_arn            = ""     # string | optional
  track_latest             = false  # bool | optional

  # arn                      = ""     # string | computed
  # arn_without_revision     = ""     # string | computed
  # revision                 = 0      # number | computed

  ephemeral_storage { # list [0..1]
    size_in_gib = 0      # number | required

  }

  inference_accelerator { # set
    device_name = ""     # string | required
    device_type = ""     # string | required

  }

  placement_constraints { # set [0..10]
    type       = ""     # string | required
    expression = ""     # string | optional

  }

  proxy_configuration { # list [0..1]
    container_name = ""     # string | required
    properties     = {}     # map(string) | optional
    type           = ""     # string | optional

  }

  runtime_platform { # list [0..1]
    cpu_architecture        = ""     # string | optional
    operating_system_family = ""     # string | optional

  }

  volume { # set
    name                = ""     # string | required
    configure_at_launch = false  # bool | optional+computed
    host_path           = ""     # string | optional

    docker_volume_configuration { # list [0..1]
      autoprovision = false  # bool | optional
      driver        = ""     # string | optional+computed
      driver_opts   = {}     # map(string) | optional
      labels        = {}     # map(string) | optional
      scope         = ""     # string | optional+computed

    }

    efs_volume_configuration { # list [0..1]
      file_system_id          = ""     # string | required
      root_directory          = ""     # string | optional
      transit_encryption      = ""     # string | optional
      transit_encryption_port = 0      # number | optional

      authorization_config { # list [0..1]
        access_point_id = ""     # string | optional
        iam             = ""     # string | optional

      }

    }

    fsx_windows_file_server_volume_configuration { # list [0..1]
      file_system_id = ""     # string | required
      root_directory = ""     # string | required

      authorization_config { # list [1..1]
        credentials_parameter = ""     # string | required
        domain                = ""     # string | required

      }

    }

  }

}

