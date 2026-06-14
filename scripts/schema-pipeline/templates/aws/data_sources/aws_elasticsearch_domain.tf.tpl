# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_elasticsearch_domain                                │
# └──────────────────────────────────────────────────────────────┘
data "aws_elasticsearch_domain" "this" {

  domain_name               = ""     # string | required
  id                        = ""     # string | optional+computed
  tags                      = {}     # map(string) | optional+computed

  # access_policies           = ""     # string | computed
  # advanced_options          = {}     # map(string) | computed
  # advanced_security_options = [  # list(object)
  #   {
  #     enabled = false
  #     internal_user_database_enabled = false
  #   }
  # ]
  # arn                       = ""     # string | computed
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
  # created                   = false  # bool | computed
  # deleted                   = false  # bool | computed
  # domain_id                 = ""     # string | computed
  # ebs_options = [  # list(object)
  #   {
  #     ebs_enabled = false
  #     iops = 0
  #     throughput = 0
  #     volume_size = 0
  #     volume_type = ""
  #   }
  # ]
  # elasticsearch_version     = ""     # string | computed
  # encryption_at_rest = [  # list(object)
  #   {
  #     enabled = false
  #     kms_key_id = ""
  #   }
  # ]
  # endpoint                  = ""     # string | computed
  # kibana_endpoint           = ""     # string | computed
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
  # processing                = false  # bool | computed
  # snapshot_options = [  # list(object)
  #   {
  #     automated_snapshot_start_hour = 0
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

}

