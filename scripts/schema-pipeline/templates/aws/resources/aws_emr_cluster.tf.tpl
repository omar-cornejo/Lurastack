# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_emr_cluster                                     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_emr_cluster" "this" {

  name                              = ""     # string | required
  release_label                     = ""     # string | required
  service_role                      = ""     # string | required
  additional_info                   = ""     # string | optional
  applications                      = []     # set(string) | optional
  autoscaling_role                  = ""     # string | optional
  configurations                    = ""     # string | optional
  configurations_json               = ""     # string | optional
  custom_ami_id                     = ""     # string | optional
  ebs_root_volume_size              = 0      # number | optional
  id                                = ""     # string | optional+computed
  keep_job_flow_alive_when_no_steps = false  # bool | optional+computed
  list_steps_states                 = []     # set(string) | optional
  log_encryption_kms_key_id         = ""     # string | optional
  log_uri                           = ""     # string | optional
  placement_group_config            = []     # list(object({ instance_role: string, placement_strategy: string })) | optional
  scale_down_behavior               = ""     # string | optional+computed
  security_configuration            = ""     # string | optional
  step                              = []     # list(object({ action_on_failure: string, hadoop_jar_step: list(object({ args: list(string), jar: string, main_class: string, properties: map(string) })), name: string })) | optional+computed
  step_concurrency_level            = 0      # number | optional
  tags                              = {}     # map(string) | optional
  tags_all                          = {}     # map(string) | optional+computed
  termination_protection            = false  # bool | optional+computed
  unhealthy_node_replacement        = false  # bool | optional
  visible_to_all_users              = false  # bool | optional

  # arn                               = ""     # string | computed
  # cluster_state                     = ""     # string | computed
  # master_public_dns                 = ""     # string | computed

  auto_termination_policy { # list [0..1]
    idle_timeout = 0      # number | optional

  }

  bootstrap_action { # list
    name = ""     # string | required
    path = ""     # string | required
    args = []     # list(string) | optional

  }

  core_instance_fleet { # list [0..1]
    name                           = ""     # string | optional
    target_on_demand_capacity      = 0      # number | optional
    target_spot_capacity           = 0      # number | optional

    # id                             = ""     # string | computed
    # provisioned_on_demand_capacity = 0      # number | computed
    # provisioned_spot_capacity      = 0      # number | computed

    instance_type_configs { # set
      instance_type                              = ""     # string | required
      bid_price                                  = ""     # string | optional
      bid_price_as_percentage_of_on_demand_price = 0      # number | optional
      weighted_capacity                          = 0      # number | optional

      configurations { # set
        classification = ""     # string | optional
        properties     = {}     # map(string) | optional

      }

      ebs_config { # set
        size                 = 0      # number | required
        type                 = ""     # string | required
        iops                 = 0      # number | optional
        volumes_per_instance = 0      # number | optional

      }

    }

    launch_specifications { # list [0..1]

      on_demand_specification { # list
        allocation_strategy = ""     # string | required

      }

      spot_specification { # list
        allocation_strategy      = ""     # string | required
        timeout_action           = ""     # string | required
        timeout_duration_minutes = 0      # number | required
        block_duration_minutes   = 0      # number | optional

      }

    }

  }

  core_instance_group { # list [0..1]
    instance_type      = ""     # string | required
    autoscaling_policy = ""     # string | optional
    bid_price          = ""     # string | optional
    instance_count     = 0      # number | optional
    name               = ""     # string | optional

    # id                 = ""     # string | computed

    ebs_config { # set
      size                 = 0      # number | required
      type                 = ""     # string | required
      iops                 = 0      # number | optional
      throughput           = 0      # number | optional
      volumes_per_instance = 0      # number | optional

    }

  }

  ec2_attributes { # list [0..1]
    instance_profile                  = ""     # string | required
    additional_master_security_groups = ""     # string | optional
    additional_slave_security_groups  = ""     # string | optional
    emr_managed_master_security_group = ""     # string | optional+computed
    emr_managed_slave_security_group  = ""     # string | optional+computed
    key_name                          = ""     # string | optional
    service_access_security_group     = ""     # string | optional+computed
    subnet_id                         = ""     # string | optional+computed
    subnet_ids                        = []     # set(string) | optional+computed

  }

  kerberos_attributes { # list [0..1]
    kdc_admin_password                   = ""     # string | required+sensitive
    realm                                = ""     # string | required
    ad_domain_join_password              = ""     # string | optional+sensitive
    ad_domain_join_user                  = ""     # string | optional
    cross_realm_trust_principal_password = ""     # string | optional+sensitive

  }

  master_instance_fleet { # list [0..1]
    name                           = ""     # string | optional
    target_on_demand_capacity      = 0      # number | optional
    target_spot_capacity           = 0      # number | optional

    # id                             = ""     # string | computed
    # provisioned_on_demand_capacity = 0      # number | computed
    # provisioned_spot_capacity      = 0      # number | computed

    instance_type_configs { # set
      instance_type                              = ""     # string | required
      bid_price                                  = ""     # string | optional
      bid_price_as_percentage_of_on_demand_price = 0      # number | optional
      weighted_capacity                          = 0      # number | optional

      configurations { # set
        classification = ""     # string | optional
        properties     = {}     # map(string) | optional

      }

      ebs_config { # set
        size                 = 0      # number | required
        type                 = ""     # string | required
        iops                 = 0      # number | optional
        volumes_per_instance = 0      # number | optional

      }

    }

    launch_specifications { # list [0..1]

      on_demand_specification { # list
        allocation_strategy = ""     # string | required

      }

      spot_specification { # list
        allocation_strategy      = ""     # string | required
        timeout_action           = ""     # string | required
        timeout_duration_minutes = 0      # number | required
        block_duration_minutes   = 0      # number | optional

      }

    }

  }

  master_instance_group { # list [0..1]
    instance_type  = ""     # string | required
    bid_price      = ""     # string | optional
    instance_count = 0      # number | optional
    name           = ""     # string | optional

    # id             = ""     # string | computed

    ebs_config { # set
      size                 = 0      # number | required
      type                 = ""     # string | required
      iops                 = 0      # number | optional
      throughput           = 0      # number | optional
      volumes_per_instance = 0      # number | optional

    }

  }

}

