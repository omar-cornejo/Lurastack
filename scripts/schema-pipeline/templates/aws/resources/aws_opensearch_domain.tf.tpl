# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_opensearch_domain                               │
# └──────────────────────────────────────────────────────────────┘
resource "aws_opensearch_domain" "this" {

  domain_name                       = ""     # string | required
  access_policies                   = ""     # string | optional+computed
  advanced_options                  = {}     # map(string) | optional+computed
  engine_version                    = ""     # string | optional+computed
  id                                = ""     # string | optional+computed
  ip_address_type                   = ""     # string | optional+computed
  tags                              = {}     # map(string) | optional
  tags_all                          = {}     # map(string) | optional+computed

  # arn                               = ""     # string | computed
  # dashboard_endpoint                = ""     # string | computed
  # dashboard_endpoint_v2             = ""     # string | computed
  # domain_endpoint_v2_hosted_zone_id = ""     # string | computed
  # domain_id                         = ""     # string | computed
  # endpoint                          = ""     # string | computed
  # endpoint_v2                       = ""     # string | computed
  # kibana_endpoint                   = ""     # string | computed+DEPRECATED

  advanced_security_options { # list [0..1]
    enabled                        = false  # bool | required
    anonymous_auth_enabled         = false  # bool | optional+computed
    internal_user_database_enabled = false  # bool | optional

    master_user_options { # list [0..1]
      master_user_arn      = ""     # string | optional
      master_user_name     = ""     # string | optional
      master_user_password = ""     # string | optional+sensitive

    }

  }

  auto_tune_options { # list [0..1]
    desired_state       = ""     # string | required
    rollback_on_disable = ""     # string | optional+computed
    use_off_peak_window = false  # bool | optional

    maintenance_schedule { # set
      cron_expression_for_recurrence = ""     # string | required
      start_at                       = ""     # string | required

      duration { # list [1..1]
        unit  = ""     # string | required
        value = 0      # number | required

      }

    }

  }

  cluster_config { # list [0..1]
    dedicated_master_count        = 0      # number | optional
    dedicated_master_enabled      = false  # bool | optional
    dedicated_master_type         = ""     # string | optional
    instance_count                = 0      # number | optional
    instance_type                 = ""     # string | optional
    multi_az_with_standby_enabled = false  # bool | optional
    warm_count                    = 0      # number | optional
    warm_enabled                  = false  # bool | optional
    warm_type                     = ""     # string | optional
    zone_awareness_enabled        = false  # bool | optional

    cold_storage_options { # list [0..1]
      enabled = false  # bool | optional+computed

    }

    node_options { # list
      node_type = ""     # string | optional+computed

      node_config { # list [0..1]
        count   = 0      # number | optional+computed
        enabled = false  # bool | optional+computed
        type    = ""     # string | optional+computed

      }

    }

    zone_awareness_config { # list [0..1]
      availability_zone_count = 0      # number | optional

    }

  }

  cognito_options { # list [0..1]
    identity_pool_id = ""     # string | required
    role_arn         = ""     # string | required
    user_pool_id     = ""     # string | required
    enabled          = false  # bool | optional

  }

  domain_endpoint_options { # list [0..1]
    custom_endpoint                 = ""     # string | optional
    custom_endpoint_certificate_arn = ""     # string | optional
    custom_endpoint_enabled         = false  # bool | optional
    enforce_https                   = false  # bool | optional
    tls_security_policy             = ""     # string | optional+computed

  }

  ebs_options { # list [0..1]
    ebs_enabled = false  # bool | required
    iops        = 0      # number | optional+computed
    throughput  = 0      # number | optional+computed
    volume_size = 0      # number | optional
    volume_type = ""     # string | optional+computed

  }

  encrypt_at_rest { # list [0..1]
    enabled    = false  # bool | required
    kms_key_id = ""     # string | optional+computed

  }

  log_publishing_options { # set
    cloudwatch_log_group_arn = ""     # string | required
    log_type                 = ""     # string | required
    enabled                  = false  # bool | optional

  }

  node_to_node_encryption { # list [0..1]
    enabled = false  # bool | required

  }

  off_peak_window_options { # list [0..1]
    enabled = false  # bool | optional+computed

    off_peak_window { # list [0..1]

      window_start_time { # list [0..1]
        hours   = 0      # number | optional+computed
        minutes = 0      # number | optional+computed

      }

    }

  }

  snapshot_options { # list [0..1]
    automated_snapshot_start_hour = 0      # number | required

  }

  software_update_options { # list [0..1]
    auto_software_update_enabled = false  # bool | optional+computed

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

  vpc_options { # list [0..1]
    security_group_ids = []     # set(string) | optional
    subnet_ids         = []     # set(string) | optional

    # availability_zones = []     # set(string) | computed
    # vpc_id             = ""     # string | computed

  }

}

