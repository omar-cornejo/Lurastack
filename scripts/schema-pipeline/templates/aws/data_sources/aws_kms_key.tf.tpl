# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_kms_key                                             │
# └──────────────────────────────────────────────────────────────┘
data "aws_kms_key" "this" {

  key_id                          = ""     # string | required
  grant_tokens                    = []     # list(string) | optional
  id                              = ""     # string | optional+computed

  # arn                             = ""     # string | computed
  # aws_account_id                  = ""     # string | computed
  # cloud_hsm_cluster_id            = ""     # string | computed
  # creation_date                   = ""     # string | computed
  # custom_key_store_id             = ""     # string | computed
  # customer_master_key_spec        = ""     # string | computed
  # deletion_date                   = ""     # string | computed
  # description                     = ""     # string | computed
  # enabled                         = false  # bool | computed
  # expiration_model                = ""     # string | computed
  # key_manager                     = ""     # string | computed
  # key_spec                        = ""     # string | computed
  # key_state                       = ""     # string | computed
  # key_usage                       = ""     # string | computed
  # multi_region                    = false  # bool | computed
  # multi_region_configuration = [  # list(object)
  #   {
  #     multi_region_key_type = ""
  #     primary_key = [  # list(object)
  #       {
  #         arn = ""
  #         region = ""
  #       }
  #     ]
  #     replica_keys = [  # list(object)
  #       {
  #         arn = ""
  #         region = ""
  #       }
  #     ]
  #   }
  # ]
  # origin                          = ""     # string | computed
  # pending_deletion_window_in_days = 0      # number | computed
  # valid_to                        = ""     # string | computed
  # xks_key_configuration = [  # list(object)
  #   {
  #     id = ""
  #   }
  # ]

}

