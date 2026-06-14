# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_batch_job_definition                                │
# └──────────────────────────────────────────────────────────────┘
data "aws_batch_job_definition" "this" {

  arn                          = ""     # string | optional
  name                         = ""     # string | optional
  revision                     = 0      # number | optional
  status                       = ""     # string | optional

  # arn_prefix                   = ""     # string | computed
  # container_orchestration_type = ""     # string | computed
  # eks_properties = [  # list(object)
  #   {
  #     pod_properties = [  # list(object)
  #       {
  #         containers = [  # list(object)
  #           {
  #             args = []  # list(string)
  #             command = []  # list(string)
  #             env = [  # list(object)
  #               {
  #                 name = ""
  #                 value = ""
  #               }
  #             ]
  #             image = ""
  #             image_pull_policy = ""
  #             name = ""
  #             resources = [  # list(object)
  #               {
  #                 limits = {}  # map(string)
  #                 requests = {}  # map(string)
  #               }
  #             ]
  #             security_context = [  # list(object)
  #               {
  #                 privileged = false
  #                 read_only_root_file_system = false
  #                 run_as_group = 0
  #                 run_as_non_root = false
  #                 run_as_user = 0
  #               }
  #             ]
  #             volume_mounts = [  # list(object)
  #               {
  #                 mount_path = ""
  #                 name = ""
  #                 read_only = false
  #               }
  #             ]
  #           }
  #         ]
  #         dns_policy = ""
  #         host_network = false
  #         image_pull_secrets = [  # list(object)
  #           {
  #             name = ""
  #           }
  #         ]
  #         init_containers = [  # list(object)
  #           {
  #             args = []  # list(string)
  #             command = []  # list(string)
  #             env = [  # list(object)
  #               {
  #                 name = ""
  #                 value = ""
  #               }
  #             ]
  #             image = ""
  #             image_pull_policy = ""
  #             name = ""
  #             resources = [  # list(object)
  #               {
  #                 limits = {}  # map(string)
  #                 requests = {}  # map(string)
  #               }
  #             ]
  #             security_context = [  # list(object)
  #               {
  #                 privileged = false
  #                 read_only_root_file_system = false
  #                 run_as_group = 0
  #                 run_as_non_root = false
  #                 run_as_user = 0
  #               }
  #             ]
  #             volume_mounts = [  # list(object)
  #               {
  #                 mount_path = ""
  #                 name = ""
  #                 read_only = false
  #               }
  #             ]
  #           }
  #         ]
  #         metadata = [  # list(object)
  #           {
  #             labels = {}  # map(string)
  #           }
  #         ]
  #         service_account_name = ""
  #         share_process_namespace = false
  #         volumes = [  # list(object)
  #           {
  #             empty_dir = [  # list(object)
  #               {
  #                 medium = ""
  #                 size_limit = ""
  #               }
  #             ]
  #             host_path = [  # list(object)
  #               {
  #                 path = ""
  #               }
  #             ]
  #             name = ""
  #             secret = [  # list(object)
  #               {
  #                 optional = false
  #                 secret_name = ""
  #               }
  #             ]
  #           }
  #         ]
  #       }
  #     ]
  #   }
  # ]
  # id                           = ""     # string | computed
  # node_properties = [  # list(object)
  #   {
  #     main_node = 0
  #     node_range_properties = [  # list(object)
  #       {
  #         container = [  # list(object)
  #           {
  #             command = []  # list(string)
  #             environment = [  # list(object)
  #               {
  #                 name = ""
  #                 value = ""
  #               }
  #             ]
  #             ephemeral_storage = [  # list(object)
  #               {
  #                 size_in_gib = 0
  #               }
  #             ]
  #             execution_role_arn = ""
  #             fargate_platform_configuration = [  # list(object)
  #               {
  #                 platform_version = ""
  #               }
  #             ]
  #             image = ""
  #             instance_type = ""
  #             job_role_arn = ""
  #             linux_parameters = [  # list(object)
  #               {
  #                 devices = [  # list(object)
  #                   {
  #                     container_path = ""
  #                     host_path = ""
  #                     permissions = []  # list(string)
  #                   }
  #                 ]
  #                 init_process_enabled = false
  #                 max_swap = 0
  #                 shared_memory_size = 0
  #                 swappiness = 0
  #                 tmpfs = [  # list(object)
  #                   {
  #                     container_path = ""
  #                     mount_options = []  # list(string)
  #                     size = 0
  #                   }
  #                 ]
  #               }
  #             ]
  #             log_configuration = [  # list(object)
  #               {
  #                 log_driver = ""
  #                 options = {}  # map(string)
  #                 secret_options = [  # list(object)
  #                   {
  #                     name = ""
  #                     value_from = ""
  #                   }
  #                 ]
  #               }
  #             ]
  #             mount_points = [  # list(object)
  #               {
  #                 container_path = ""
  #                 read_only = false
  #                 source_volume = ""
  #               }
  #             ]
  #             network_configuration = [  # list(object)
  #               {
  #                 assign_public_ip = false
  #               }
  #             ]
  #             privileged = false
  #             readonly_root_filesystem = false
  #             resource_requirements = [  # list(object)
  #               {
  #                 type = ""
  #                 value = ""
  #               }
  #             ]
  #             runtime_platform = [  # list(object)
  #               {
  #                 cpu_architecture = ""
  #                 operating_system_family = ""
  #               }
  #             ]
  #             secrets = [  # list(object)
  #               {
  #                 name = ""
  #                 value_from = ""
  #               }
  #             ]
  #             ulimits = [  # list(object)
  #               {
  #                 hard_limit = 0
  #                 name = ""
  #                 soft_limit = 0
  #               }
  #             ]
  #             user = ""
  #             volumes = [  # list(object)
  #               {
  #                 efs_volume_configuration = [  # list(object)
  #                   {
  #                     authorization_config = [  # list(object)
  #                       {
  #                         access_point_id = ""
  #                         iam = ""
  #                       }
  #                     ]
  #                     file_system_id = ""
  #                     root_directory = ""
  #                     transit_encryption = ""
  #                     transit_encryption_port = 0
  #                   }
  #                 ]
  #                 host = [  # list(object)
  #                   {
  #                     source_path = ""
  #                   }
  #                 ]
  #                 name = ""
  #               }
  #             ]
  #           }
  #         ]
  #         target_nodes = ""
  #       }
  #     ]
  #     num_nodes = 0
  #   }
  # ]
  # retry_strategy = [  # list(object)
  #   {
  #     attempts = 0
  #     evaluate_on_exit = [  # list(object)
  #       {
  #         action = ""
  #         on_exit_code = ""
  #         on_reason = ""
  #         on_status_reason = ""
  #       }
  #     ]
  #   }
  # ]
  # scheduling_priority          = 0      # number | computed
  # tags                         = {}     # map(string) | computed
  # timeout = [  # list(object)
  #   {
  #     attempt_duration_seconds = 0
  #   }
  # ]
  # type                         = ""     # string | computed

}

