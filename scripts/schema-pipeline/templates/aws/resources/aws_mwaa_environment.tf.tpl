# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_mwaa_environment                                │
# └──────────────────────────────────────────────────────────────┘
resource "aws_mwaa_environment" "this" {

  dag_s3_path                      = ""     # string | required
  execution_role_arn               = ""     # string | required
  name                             = ""     # string | required
  source_bucket_arn                = ""     # string | required
  airflow_configuration_options    = {}     # map(string) | optional+sensitive
  airflow_version                  = ""     # string | optional+computed
  endpoint_management              = ""     # string | optional+computed
  environment_class                = ""     # string | optional+computed
  id                               = ""     # string | optional+computed
  kms_key                          = ""     # string | optional
  max_webservers                   = 0      # number | optional+computed
  max_workers                      = 0      # number | optional+computed
  min_webservers                   = 0      # number | optional+computed
  min_workers                      = 0      # number | optional+computed
  plugins_s3_object_version        = ""     # string | optional+computed
  plugins_s3_path                  = ""     # string | optional
  requirements_s3_object_version   = ""     # string | optional+computed
  requirements_s3_path             = ""     # string | optional
  schedulers                       = 0      # number | optional+computed
  startup_script_s3_object_version = ""     # string | optional+computed
  startup_script_s3_path           = ""     # string | optional
  tags                             = {}     # map(string) | optional
  tags_all                         = {}     # map(string) | optional+computed
  webserver_access_mode            = ""     # string | optional+computed
  weekly_maintenance_window_start  = ""     # string | optional+computed

  # arn                              = ""     # string | computed
  # created_at                       = ""     # string | computed
  # database_vpc_endpoint_service    = ""     # string | computed
  # last_updated = [  # list(object)
  #   {
  #     created_at = ""
  #     error = [  # list(object)
  #       {
  #         error_code = ""
  #         error_message = ""
  #       }
  #     ]
  #     status = ""
  #   }
  # ]
  # service_role_arn                 = ""     # string | computed
  # status                           = ""     # string | computed
  # webserver_url                    = ""     # string | computed
  # webserver_vpc_endpoint_service   = ""     # string | computed

  logging_configuration { # list [0..1]

    dag_processing_logs { # list [0..1]
      enabled                   = false  # bool | optional+computed
      log_level                 = ""     # string | optional+computed

      # cloud_watch_log_group_arn = ""     # string | computed

    }

    scheduler_logs { # list [0..1]
      enabled                   = false  # bool | optional+computed
      log_level                 = ""     # string | optional+computed

      # cloud_watch_log_group_arn = ""     # string | computed

    }

    task_logs { # list [0..1]
      enabled                   = false  # bool | optional+computed
      log_level                 = ""     # string | optional+computed

      # cloud_watch_log_group_arn = ""     # string | computed

    }

    webserver_logs { # list [0..1]
      enabled                   = false  # bool | optional+computed
      log_level                 = ""     # string | optional+computed

      # cloud_watch_log_group_arn = ""     # string | computed

    }

    worker_logs { # list [0..1]
      enabled                   = false  # bool | optional+computed
      log_level                 = ""     # string | optional+computed

      # cloud_watch_log_group_arn = ""     # string | computed

    }

  }

  network_configuration { # list [1..1]
    security_group_ids = []     # set(string) | required
    subnet_ids         = []     # set(string) | required

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

