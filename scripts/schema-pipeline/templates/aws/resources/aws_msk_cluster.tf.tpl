# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_msk_cluster                                     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_msk_cluster" "this" {

  cluster_name                                  = ""     # string | required
  kafka_version                                 = ""     # string | required
  number_of_broker_nodes                        = 0      # number | required
  enhanced_monitoring                           = ""     # string | optional
  id                                            = ""     # string | optional+computed
  storage_mode                                  = ""     # string | optional+computed
  tags                                          = {}     # map(string) | optional
  tags_all                                      = {}     # map(string) | optional+computed

  # arn                                           = ""     # string | computed
  # bootstrap_brokers                             = ""     # string | computed
  # bootstrap_brokers_public_sasl_iam             = ""     # string | computed
  # bootstrap_brokers_public_sasl_scram           = ""     # string | computed
  # bootstrap_brokers_public_tls                  = ""     # string | computed
  # bootstrap_brokers_sasl_iam                    = ""     # string | computed
  # bootstrap_brokers_sasl_scram                  = ""     # string | computed
  # bootstrap_brokers_tls                         = ""     # string | computed
  # bootstrap_brokers_vpc_connectivity_sasl_iam   = ""     # string | computed
  # bootstrap_brokers_vpc_connectivity_sasl_scram = ""     # string | computed
  # bootstrap_brokers_vpc_connectivity_tls        = ""     # string | computed
  # cluster_uuid                                  = ""     # string | computed
  # current_version                               = ""     # string | computed
  # zookeeper_connect_string                      = ""     # string | computed
  # zookeeper_connect_string_tls                  = ""     # string | computed

  broker_node_group_info { # list [1..1]
    client_subnets  = []     # set(string) | required
    instance_type   = ""     # string | required
    security_groups = []     # set(string) | required
    az_distribution = ""     # string | optional

    connectivity_info { # list [0..1]

      public_access { # list [0..1]
        type = ""     # string | optional+computed

      }

      vpc_connectivity { # list [0..1]

        client_authentication { # list [0..1]
          tls = false  # bool | optional+computed

          sasl { # list [0..1]
            iam   = false  # bool | optional+computed
            scram = false  # bool | optional+computed

          }

        }

      }

    }

    storage_info { # list [0..1]

      ebs_storage_info { # list [0..1]
        volume_size = 0      # number | optional

        provisioned_throughput { # list [0..1]
          enabled           = false  # bool | optional
          volume_throughput = 0      # number | optional

        }

      }

    }

  }

  client_authentication { # list [0..1]
    unauthenticated = false  # bool | optional

    sasl { # list [0..1]
      iam   = false  # bool | optional
      scram = false  # bool | optional

    }

    tls { # list [0..1]
      certificate_authority_arns = []     # set(string) | optional

    }

  }

  configuration_info { # list [0..1]
    arn      = ""     # string | required
    revision = 0      # number | required

  }

  encryption_info { # list [0..1]
    encryption_at_rest_kms_key_arn = ""     # string | optional+computed

    encryption_in_transit { # list [0..1]
      client_broker = ""     # string | optional
      in_cluster    = false  # bool | optional

    }

  }

  logging_info { # list [0..1]

    broker_logs { # list [1..1]

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

  open_monitoring { # list [0..1]

    prometheus { # list [1..1]

      jmx_exporter { # list [0..1]
        enabled_in_broker = false  # bool | required

      }

      node_exporter { # list [0..1]
        enabled_in_broker = false  # bool | required

      }

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

