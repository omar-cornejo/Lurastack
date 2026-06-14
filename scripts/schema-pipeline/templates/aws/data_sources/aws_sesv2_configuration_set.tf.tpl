# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_sesv2_configuration_set                             │
# └──────────────────────────────────────────────────────────────┘
data "aws_sesv2_configuration_set" "this" {

  configuration_set_name = ""     # string | required
  id                     = ""     # string | optional+computed
  tags                   = {}     # map(string) | optional+computed

  # arn                    = ""     # string | computed
  # delivery_options = [  # list(object)
  #   {
  #     max_delivery_seconds = 0
  #     sending_pool_name = ""
  #     tls_policy = ""
  #   }
  # ]
  # reputation_options = [  # list(object)
  #   {
  #     last_fresh_start = ""
  #     reputation_metrics_enabled = false
  #   }
  # ]
  # sending_options = [  # list(object)
  #   {
  #     sending_enabled = false
  #   }
  # ]
  # suppression_options = [  # list(object)
  #   {
  #     suppressed_reasons = []  # list(string)
  #   }
  # ]
  # tracking_options = [  # list(object)
  #   {
  #     custom_redirect_domain = ""
  #     https_policy = ""
  #   }
  # ]
  # vdm_options = [  # list(object)
  #   {
  #     dashboard_options = [  # list(object)
  #       {
  #         engagement_metrics = ""
  #       }
  #     ]
  #     guardian_options = [  # list(object)
  #       {
  #         optimized_shared_delivery = ""
  #       }
  #     ]
  #   }
  # ]

}

