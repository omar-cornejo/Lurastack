# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_mskconnect_connector                            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_mskconnect_connector" "this" {

  connector_configuration    = {}     # map(string) | required
  kafkaconnect_version       = ""     # string | required
  name                       = ""     # string | required
  service_execution_role_arn = ""     # string | required
  description                = ""     # string | optional
  id                         = ""     # string | optional+computed
  tags                       = {}     # map(string) | optional
  tags_all                   = {}     # map(string) | optional+computed

  # arn                        = ""     # string | computed
  # version                    = ""     # string | computed

  capacity { # list [1..1]

    autoscaling { # list [0..1]
      max_worker_count = 0      # number | required
      min_worker_count = 0      # number | required
      mcu_count        = 0      # number | optional

      scale_in_policy { # list [0..1]
        cpu_utilization_percentage = 0      # number | optional+computed

      }

      scale_out_policy { # list [0..1]
        cpu_utilization_percentage = 0      # number | optional+computed

      }

    }

    provisioned_capacity { # list [0..1]
      worker_count = 0      # number | required
      mcu_count    = 0      # number | optional

    }

  }

  kafka_cluster { # list [1..1]

    apache_kafka_cluster { # list [1..1]
      bootstrap_servers = ""     # string | required

      vpc { # list [1..1]
        security_groups = []     # set(string) | required
        subnets         = []     # set(string) | required

      }

    }

  }

  kafka_cluster_client_authentication { # list [1..1]
    authentication_type = ""     # string | optional

  }

  kafka_cluster_encryption_in_transit { # list [1..1]
    encryption_type = ""     # string | optional

  }

  log_delivery { # list [0..1]

    worker_log_delivery { # list [1..1]

      cloudwatch_logs { # list [0..1]
        enabled   = false  # bool | required
        log_group = ""     # string | optional

      }

      firehose { # list [0..1]
        enabled         = false  # bool | required
        delivery_stream = ""     # string | optional

      }

      s3 { # list [0..1]
        enabled = false  # bool | required
        bucket  = ""     # string | optional
        prefix  = ""     # string | optional

      }

    }

  }

  plugin { # set [1..*]

    custom_plugin { # list [1..1]
      arn      = ""     # string | required
      revision = 0      # number | required

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

  worker_configuration { # list [0..1]
    arn      = ""     # string | required
    revision = 0      # number | required

  }

}

