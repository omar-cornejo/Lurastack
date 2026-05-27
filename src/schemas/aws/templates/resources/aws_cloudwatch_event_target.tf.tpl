# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_cloudwatch_event_target                         │
# └──────────────────────────────────────────────────────────────┘
resource "aws_cloudwatch_event_target" "this" {

  arn            = ""     # string | required
  rule           = ""     # string | required
  event_bus_name = ""     # string | optional
  force_destroy  = false  # bool | optional
  id             = ""     # string | optional+computed
  input          = ""     # string | optional
  input_path     = ""     # string | optional
  role_arn       = ""     # string | optional
  target_id      = ""     # string | optional+computed

  appsync_target { # list [0..1]
    graphql_operation = ""     # string | optional

  }

  batch_target { # list [0..1]
    job_definition = ""     # string | required
    job_name       = ""     # string | required
    array_size     = 0      # number | optional
    job_attempts   = 0      # number | optional

  }

  dead_letter_config { # list [0..1]
    arn = ""     # string | optional

  }

  ecs_target { # list [0..1]
    task_definition_arn     = ""     # string | required
    enable_ecs_managed_tags = false  # bool | optional
    enable_execute_command  = false  # bool | optional
    group                   = ""     # string | optional
    launch_type             = ""     # string | optional
    platform_version        = ""     # string | optional
    propagate_tags          = ""     # string | optional
    tags                    = {}     # map(string) | optional
    task_count              = 0      # number | optional

    capacity_provider_strategy { # set
      capacity_provider = ""     # string | required
      base              = 0      # number | optional
      weight            = 0      # number | optional

    }

    network_configuration { # list [0..1]
      subnets          = []     # set(string) | required
      assign_public_ip = false  # bool | optional
      security_groups  = []     # set(string) | optional

    }

    ordered_placement_strategy { # list [0..5]
      type  = ""     # string | required
      field = ""     # string | optional

    }

    placement_constraint { # set [0..10]
      type       = ""     # string | required
      expression = ""     # string | optional

    }

  }

  http_target { # list [0..1]
    header_parameters       = {}     # map(string) | optional
    path_parameter_values   = []     # list(string) | optional
    query_string_parameters = {}     # map(string) | optional

  }

  input_transformer { # list [0..1]
    input_template = ""     # string | required
    input_paths    = {}     # map(string) | optional

  }

  kinesis_target { # list [0..1]
    partition_key_path = ""     # string | optional

  }

  redshift_target { # list [0..1]
    database            = ""     # string | required
    db_user             = ""     # string | optional
    secrets_manager_arn = ""     # string | optional
    sql                 = ""     # string | optional
    statement_name      = ""     # string | optional
    with_event          = false  # bool | optional

  }

  retry_policy { # list [0..1]
    maximum_event_age_in_seconds = 0      # number | optional
    maximum_retry_attempts       = 0      # number | optional

  }

  run_command_targets { # list [0..5]
    key    = ""     # string | required
    values = []     # list(string) | required

  }

  sagemaker_pipeline_target { # list [0..1]

    pipeline_parameter_list { # set [0..200]
      name  = ""     # string | required
      value = ""     # string | required

    }

  }

  sqs_target { # list [0..1]
    message_group_id = ""     # string | optional

  }

}

