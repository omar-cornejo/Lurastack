# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_elasticsearch_domain                            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_elasticsearch_domain" "this" {

  domain_name           = ""     # string | required
  access_policies       = ""     # string | optional+computed
  advanced_options      = {}     # map(string) | optional+computed
  elasticsearch_version = ""     # string | optional
  id                    = ""     # string | optional+computed
  tags                  = {}     # map(string) | optional
  tags_all              = {}     # map(string) | optional+computed

  # arn                   = ""     # string | computed
  # domain_id             = ""     # string | computed
  # endpoint              = ""     # string | computed
  # kibana_endpoint       = ""     # string | computed

  advanced_security_options { # list [0..1]
    enabled                        = false  # bool | required
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
    dedicated_master_count   = 0      # number | optional
    dedicated_master_enabled = false  # bool | optional
    dedicated_master_type    = ""     # string | optional
    instance_count           = 0      # number | optional
    instance_type            = ""     # string | optional
    warm_count               = 0      # number | optional
    warm_enabled             = false  # bool | optional
    warm_type                = ""     # string | optional
    zone_awareness_enabled   = false  # bool | optional

    cold_storage_options { # list [0..1]
      enabled = false  # bool | optional+computed

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

  snapshot_options { # list [0..1]
    automated_snapshot_start_hour = 0      # number | required

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

