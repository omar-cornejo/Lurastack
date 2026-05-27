# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_lambda_function                                 │
# └──────────────────────────────────────────────────────────────┘
resource "aws_lambda_function" "this" {

  function_name                      = ""     # string | required
  role                               = ""     # string | required
  architectures                      = []     # list(string) | optional+computed
  code_signing_config_arn            = ""     # string | optional
  description                        = ""     # string | optional
  filename                           = ""     # string | optional
  handler                            = ""     # string | optional
  id                                 = ""     # string | optional+computed
  image_uri                          = ""     # string | optional
  kms_key_arn                        = ""     # string | optional
  layers                             = []     # list(string) | optional
  memory_size                        = 0      # number | optional
  package_type                       = ""     # string | optional
  publish                            = false  # bool | optional
  replace_security_groups_on_destroy = false  # bool | optional
  replacement_security_group_ids     = []     # set(string) | optional
  reserved_concurrent_executions     = 0      # number | optional
  runtime                            = ""     # string | optional
  s3_bucket                          = ""     # string | optional
  s3_key                             = ""     # string | optional
  s3_object_version                  = ""     # string | optional
  skip_destroy                       = false  # bool | optional
  source_code_hash                   = ""     # string | optional+computed
  tags                               = {}     # map(string) | optional
  tags_all                           = {}     # map(string) | optional+computed
  timeout                            = 0      # number | optional

  # arn                                = ""     # string | computed
  # code_sha256                        = ""     # string | computed
  # invoke_arn                         = ""     # string | computed
  # last_modified                      = ""     # string | computed
  # qualified_arn                      = ""     # string | computed
  # qualified_invoke_arn               = ""     # string | computed
  # signing_job_arn                    = ""     # string | computed
  # signing_profile_version_arn        = ""     # string | computed
  # source_code_size                   = 0      # number | computed
  # version                            = ""     # string | computed

  dead_letter_config { # list [0..1]
    target_arn = ""     # string | required

  }

  environment { # list [0..1]
    variables = {}     # map(string) | optional

  }

  ephemeral_storage { # list [0..1]
    size = 0      # number | optional+computed

  }

  file_system_config { # list [0..1]
    arn              = ""     # string | required
    local_mount_path = ""     # string | required

  }

  image_config { # list [0..1]
    command           = []     # list(string) | optional
    entry_point       = []     # list(string) | optional
    working_directory = ""     # string | optional

  }

  logging_config { # list [0..1]
    log_format            = ""     # string | required
    application_log_level = ""     # string | optional
    log_group             = ""     # string | optional+computed
    system_log_level      = ""     # string | optional

  }

  snap_start { # list [0..1]
    apply_on            = ""     # string | required

    # optimization_status = ""     # string | computed

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

  tracing_config { # list [0..1]
    mode = ""     # string | required

  }

  vpc_config { # list [0..1]
    security_group_ids          = []     # set(string) | required
    subnet_ids                  = []     # set(string) | required
    ipv6_allowed_for_dual_stack = false  # bool | optional

    # vpc_id                      = ""     # string | computed

  }

}

