# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_emrcontainers_job_template                      │
# └──────────────────────────────────────────────────────────────┘
resource "aws_emrcontainers_job_template" "this" {

  name        = ""     # string | required
  id          = ""     # string | optional+computed
  kms_key_arn = ""     # string | optional
  tags        = {}     # map(string) | optional
  tags_all    = {}     # map(string) | optional+computed

  # arn         = ""     # string | computed

  job_template_data { # list [1..1]
    execution_role_arn = ""     # string | required
    release_label      = ""     # string | required
    job_tags           = {}     # map(string) | optional

    configuration_overrides { # list [0..1]

      application_configuration { # list [0..100]
        classification = ""     # string | required
        properties     = {}     # map(string) | optional

        configurations { # list [0..100]
          classification = ""     # string | optional
          properties     = {}     # map(string) | optional

        }

      }

      monitoring_configuration { # list [0..1]
        persistent_app_ui = ""     # string | optional

        cloud_watch_monitoring_configuration { # list [0..1]
          log_group_name         = ""     # string | required
          log_stream_name_prefix = ""     # string | optional

        }

        s3_monitoring_configuration { # list [0..1]
          log_uri = ""     # string | required

        }

      }

    }

    job_driver { # list [1..1]

      spark_sql_job_driver { # list [0..1]
        entry_point          = ""     # string | optional
        spark_sql_parameters = ""     # string | optional

      }

      spark_submit_job_driver { # list [0..1]
        entry_point             = ""     # string | required
        entry_point_arguments   = []     # set(string) | optional
        spark_submit_parameters = ""     # string | optional

      }

    }

  }

  timeouts { # single
    delete = ""     # string | optional

  }

}

