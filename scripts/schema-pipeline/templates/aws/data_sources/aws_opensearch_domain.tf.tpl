# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_opensearch_domain                                   │
# └──────────────────────────────────────────────────────────────┘
data "aws_opensearch_domain" "this" {

  domain_name                       = ""     # string | required
  id                                = ""     # string | optional+computed
  tags                              = {}     # map(string) | optional+computed

  # access_policies                   = ""     # string | computed
  # advanced_options                  = {}     # map(string) | computed
  # advanced_security_options = [  # list(object)
  #   {
  #     anonymous_auth_enabled = false
  #     enabled = false
  #     internal_user_database_enabled = false
  #   }
  # ]
  # arn                               = ""     # string | computed
  # auto_tune_options = [  # list(object)
  #   {
  #     desired_state = ""
  #     maintenance_schedule = [  # set(object)
  #       {
  #         cron_expression_for_recurrence = ""
  #         duration = [  # list(object)
  #           {
  #             unit = ""
  #             value = 0
  #           }
  #         ]
  #         start_at = ""
  #       }
  #     ]
  #     rollback_on_disable = ""
  #     use_off_peak_window = false
  #   }
  # ]
  # cluster_config = [  # list(object)
  #   {
  #     cold_storage_options = [  # list(object)
  #       {
  #         enabled = false
  #       }
  #     ]
  #     dedicated_master_count = 0
  #     dedicated_master_enabled = false
  #     dedicated_master_type = ""
  #     instance_count = 0
  #     instance_type = ""
  #     multi_az_with_standby_enabled = false
  #     node_options = [  # list(object)
  #       {
  #         node_config = [  # list(object)
  #           {
  #             count = 0
  #             enabled = false
  #             type = ""
  #           }
  #         ]
  #         node_type = ""
  #       }
  #     ]
  #     warm_count = 0
  #     warm_enabled = false
  #     warm_type = ""
  #     zone_awareness_config = [  # list(object)
  #       {
  #         availability_zone_count = 0
  #       }
  #     ]
  #     zone_awareness_enabled = false
  #   }
  # ]
  # cognito_options = [  # list(object)
  #   {
  #     enabled = false
  #     identity_pool_id = ""
  #     role_arn = ""
  #     user_pool_id = ""
  #   }
  # ]
  # created                           = false  # bool | computed
  # dashboard_endpoint                = ""     # string | computed
  # dashboard_endpoint_v2             = ""     # string | computed
  # deleted                           = false  # bool | computed
  # domain_endpoint_v2_hosted_zone_id = ""     # string | computed
  # domain_id                         = ""     # string | computed
  # ebs_options = [  # list(object)
  #   {
  #     ebs_enabled = false
  #     iops = 0
  #     throughput = 0
  #     volume_size = 0
  #     volume_type = ""
  #   }
  # ]
  # encryption_at_rest = [  # list(object)
  #   {
  #     enabled = false
  #     kms_key_id = ""
  #   }
  # ]
  # endpoint                          = ""     # string | computed
  # endpoint_v2                       = ""     # string | computed
  # engine_version                    = ""     # string | computed
  # ip_address_type                   = ""     # string | computed
  # kibana_endpoint                   = ""     # string | computed+DEPRECATED
  # log_publishing_options = [  # set(object)
  #   {
  #     cloudwatch_log_group_arn = ""
  #     enabled = false
  #     log_type = ""
  #   }
  # ]
  # node_to_node_encryption = [  # list(object)
  #   {
  #     enabled = false
  #   }
  # ]
  # processing                        = false  # bool | computed
  # snapshot_options = [  # list(object)
  #   {
  #     automated_snapshot_start_hour = 0
  #   }
  # ]
  # software_update_options = [  # list(object)
  #   {
  #     auto_software_update_enabled = false
  #   }
  # ]
  # vpc_options = [  # list(object)
  #   {
  #     availability_zones = []  # set(string)
  #     security_group_ids = []  # set(string)
  #     subnet_ids = []  # set(string)
  #     vpc_id = ""
  #   }
  # ]

  off_peak_window_options { # list [0..1]

    # enabled         = false  # bool | computed
    # off_peak_window = [  # list(object)
    #   {
    #     window_start_time = [  # list(object)
    #       {
    #         hours = 0
    #         minutes = 0
    #       }
    #     ]
    #   }
    # ]

  }

}

