# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_ecs_task_definition                                 │
# └──────────────────────────────────────────────────────────────┘
data "aws_ecs_task_definition" "this" {

  task_definition          = ""     # string | required
  id                       = ""     # string | optional+computed

  # arn                      = ""     # string | computed
  # arn_without_revision     = ""     # string | computed
  # container_definitions    = ""     # string | computed
  # cpu                      = ""     # string | computed
  # enable_fault_injection   = false  # bool | computed
  # ephemeral_storage = [  # list(object)
  #   {
  #     size_in_gib = 0
  #   }
  # ]
  # execution_role_arn       = ""     # string | computed
  # family                   = ""     # string | computed
  # inference_accelerator = [  # list(object)
  #   {
  #     device_name = ""
  #     device_type = ""
  #   }
  # ]
  # ipc_mode                 = ""     # string | computed
  # memory                   = ""     # string | computed
  # network_mode             = ""     # string | computed
  # pid_mode                 = ""     # string | computed
  # placement_constraints = [  # set(object)
  #   {
  #     expression = ""
  #     type = ""
  #   }
  # ]
  # proxy_configuration = [  # list(object)
  #   {
  #     container_name = ""
  #     properties = {}  # map(string)
  #     type = ""
  #   }
  # ]
  # requires_compatibilities = []     # set(string) | computed
  # revision                 = 0      # number | computed
  # runtime_platform = [  # list(object)
  #   {
  #     cpu_architecture = ""
  #     operating_system_family = ""
  #   }
  # ]
  # status                   = ""     # string | computed
  # task_role_arn            = ""     # string | computed
  # volume = [  # set(object)
  #   {
  #     configure_at_launch = false
  #     docker_volume_configuration = [  # list(object)
  #       {
  #         autoprovision = false
  #         driver = ""
  #         driver_opts = {}  # map(string)
  #         labels = {}  # map(string)
  #         scope = ""
  #       }
  #     ]
  #     efs_volume_configuration = [  # list(object)
  #       {
  #         authorization_config = [  # list(object)
  #           {
  #             access_point_id = ""
  #             iam = ""
  #           }
  #         ]
  #         file_system_id = ""
  #         root_directory = ""
  #         transit_encryption = ""
  #         transit_encryption_port = 0
  #       }
  #     ]
  #     fsx_windows_file_server_volume_configuration = [  # list(object)
  #       {
  #         authorization_config = [  # list(object)
  #           {
  #             credentials_parameter = ""
  #             domain = ""
  #           }
  #         ]
  #         file_system_id = ""
  #         root_directory = ""
  #       }
  #     ]
  #     host_path = ""
  #     name = ""
  #   }
  # ]

}

