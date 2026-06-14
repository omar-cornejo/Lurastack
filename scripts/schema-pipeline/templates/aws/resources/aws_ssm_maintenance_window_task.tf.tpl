# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ssm_maintenance_window_task                     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ssm_maintenance_window_task" "this" {

  task_arn         = ""     # string | required
  task_type        = ""     # string | required
  window_id        = ""     # string | required
  cutoff_behavior  = ""     # string | optional
  description      = ""     # string | optional
  id               = ""     # string | optional+computed
  max_concurrency  = ""     # string | optional+computed
  max_errors       = ""     # string | optional+computed
  name             = ""     # string | optional
  priority         = 0      # number | optional
  service_role_arn = ""     # string | optional+computed

  # arn              = ""     # string | computed
  # window_task_id   = ""     # string | computed

  targets { # list [0..5]
    key    = ""     # string | required
    values = []     # list(string) | required

  }

  task_invocation_parameters { # list [0..1]

    automation_parameters { # list [0..1]
      document_version = ""     # string | optional

      parameter { # set
        name   = ""     # string | required
        values = []     # list(string) | required

      }

    }

    lambda_parameters { # list [0..1]
      client_context = ""     # string | optional
      payload        = ""     # string | optional+sensitive
      qualifier      = ""     # string | optional

    }

    run_command_parameters { # list [0..1]
      comment              = ""     # string | optional
      document_hash        = ""     # string | optional
      document_hash_type   = ""     # string | optional
      document_version     = ""     # string | optional
      output_s3_bucket     = ""     # string | optional
      output_s3_key_prefix = ""     # string | optional
      service_role_arn     = ""     # string | optional
      timeout_seconds      = 0      # number | optional

      cloudwatch_config { # list [0..1]
        cloudwatch_log_group_name = ""     # string | optional+computed
        cloudwatch_output_enabled = false  # bool | optional

      }

      notification_config { # list [0..1]
        notification_arn    = ""     # string | optional
        notification_events = []     # list(string) | optional
        notification_type   = ""     # string | optional

      }

      parameter { # set
        name   = ""     # string | required
        values = []     # list(string) | required

      }

    }

    step_functions_parameters { # list [0..1]
      input = ""     # string | optional+sensitive
      name  = ""     # string | optional

    }

  }

}

