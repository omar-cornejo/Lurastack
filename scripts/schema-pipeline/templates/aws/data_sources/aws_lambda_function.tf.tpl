# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_lambda_function                                     │
# └──────────────────────────────────────────────────────────────┘
data "aws_lambda_function" "this" {

  function_name                  = ""     # string | required
  id                             = ""     # string | optional+computed
  qualifier                      = ""     # string | optional
  tags                           = {}     # map(string) | optional+computed

  # architectures                  = []     # list(string) | computed
  # arn                            = ""     # string | computed
  # code_sha256                    = ""     # string | computed
  # code_signing_config_arn        = ""     # string | computed
  # dead_letter_config = [  # list(object)
  #   {
  #     target_arn = ""
  #   }
  # ]
  # description                    = ""     # string | computed
  # environment = [  # list(object)
  #   {
  #     variables = {}  # map(string)
  #   }
  # ]
  # ephemeral_storage = [  # list(object)
  #   {
  #     size = 0
  #   }
  # ]
  # file_system_config = [  # list(object)
  #   {
  #     arn = ""
  #     local_mount_path = ""
  #   }
  # ]
  # handler                        = ""     # string | computed
  # image_uri                      = ""     # string | computed
  # invoke_arn                     = ""     # string | computed
  # kms_key_arn                    = ""     # string | computed
  # last_modified                  = ""     # string | computed
  # layers                         = []     # list(string) | computed
  # logging_config = [  # list(object)
  #   {
  #     application_log_level = ""
  #     log_format = ""
  #     log_group = ""
  #     system_log_level = ""
  #   }
  # ]
  # memory_size                    = 0      # number | computed
  # qualified_arn                  = ""     # string | computed
  # qualified_invoke_arn           = ""     # string | computed
  # reserved_concurrent_executions = 0      # number | computed
  # role                           = ""     # string | computed
  # runtime                        = ""     # string | computed
  # signing_job_arn                = ""     # string | computed
  # signing_profile_version_arn    = ""     # string | computed
  # source_code_hash               = ""     # string | computed+DEPRECATED
  # source_code_size               = 0      # number | computed
  # timeout                        = 0      # number | computed
  # tracing_config = [  # list(object)
  #   {
  #     mode = ""
  #   }
  # ]
  # version                        = ""     # string | computed
  # vpc_config = [  # list(object)
  #   {
  #     ipv6_allowed_for_dual_stack = false
  #     security_group_ids = []  # set(string)
  #     subnet_ids = []  # set(string)
  #     vpc_id = ""
  #   }
  # ]

}

