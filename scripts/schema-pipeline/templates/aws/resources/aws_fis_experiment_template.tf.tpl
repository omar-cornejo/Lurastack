# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_fis_experiment_template                         │
# └──────────────────────────────────────────────────────────────┘
resource "aws_fis_experiment_template" "this" {

  description = ""     # string | required
  role_arn    = ""     # string | required
  id          = ""     # string | optional+computed
  tags        = {}     # map(string) | optional
  tags_all    = {}     # map(string) | optional+computed

  action { # set [1..*]
    action_id   = ""     # string | required
    name        = ""     # string | required
    description = ""     # string | optional
    start_after = []     # set(string) | optional

    parameter { # set
      key   = ""     # string | required
      value = ""     # string | required

    }

    target { # list [0..1]
      key   = ""     # string | required
      value = ""     # string | required

    }

  }

  experiment_options { # list [0..1]
    account_targeting            = ""     # string | optional
    empty_target_resolution_mode = ""     # string | optional

  }

  experiment_report_configuration { # list [0..1]
    post_experiment_duration = ""     # string | optional
    pre_experiment_duration  = ""     # string | optional

    data_sources { # list [0..1]

      cloudwatch_dashboard { # list
        dashboard_arn = ""     # string | optional

      }

    }

    outputs { # list [0..1]

      s3_configuration { # list [0..1]
        bucket_name = ""     # string | required
        prefix      = ""     # string | optional

      }

    }

  }

  log_configuration { # list [0..1]
    log_schema_version = 0      # number | required

    cloudwatch_logs_configuration { # list [0..1]
      log_group_arn = ""     # string | required

    }

    s3_configuration { # list [0..1]
      bucket_name = ""     # string | required
      prefix      = ""     # string | optional

    }

  }

  stop_condition { # set [1..*]
    source = ""     # string | required
    value  = ""     # string | optional

  }

  target { # set
    name           = ""     # string | required
    resource_type  = ""     # string | required
    selection_mode = ""     # string | required
    parameters     = {}     # map(string) | optional
    resource_arns  = []     # set(string) | optional

    filter { # list
      path   = ""     # string | required
      values = []     # set(string) | required

    }

    resource_tag { # set [0..50]
      key   = ""     # string | required
      value = ""     # string | required

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

