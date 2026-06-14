# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_mq_broker                                           │
# └──────────────────────────────────────────────────────────────┘
data "aws_mq_broker" "this" {

  broker_id                     = ""     # string | optional+computed
  broker_name                   = ""     # string | optional+computed
  id                            = ""     # string | optional+computed
  tags                          = {}     # map(string) | optional+computed

  # arn                           = ""     # string | computed
  # authentication_strategy       = ""     # string | computed
  # auto_minor_version_upgrade    = false  # bool | computed
  # configuration = [  # list(object)
  #   {
  #     id = ""
  #     revision = 0
  #   }
  # ]
  # deployment_mode               = ""     # string | computed
  # encryption_options = [  # list(object)
  #   {
  #     kms_key_id = ""
  #     use_aws_owned_key = false
  #   }
  # ]
  # engine_type                   = ""     # string | computed
  # engine_version                = ""     # string | computed
  # host_instance_type            = ""     # string | computed
  # instances = [  # list(object)
  #   {
  #     console_url = ""
  #     endpoints = []  # list(string)
  #     ip_address = ""
  #   }
  # ]
  # ldap_server_metadata = [  # list(object)
  #   {
  #     hosts = []  # list(string)
  #     role_base = ""
  #     role_name = ""
  #     role_search_matching = ""
  #     role_search_subtree = false
  #     service_account_password = ""
  #     service_account_username = ""
  #     user_base = ""
  #     user_role_name = ""
  #     user_search_matching = ""
  #     user_search_subtree = false
  #   }
  # ]
  # logs = [  # list(object)
  #   {
  #     audit = ""
  #     general = false
  #   }
  # ]
  # maintenance_window_start_time = [  # list(object)
  #   {
  #     day_of_week = ""
  #     time_of_day = ""
  #     time_zone = ""
  #   }
  # ]
  # publicly_accessible           = false  # bool | computed
  # security_groups               = []     # set(string) | computed
  # storage_type                  = ""     # string | computed
  # subnet_ids                    = []     # set(string) | computed
  # user = [  # set(object)
  #   {
  #     console_access = false
  #     groups = []  # set(string)
  #     replication_user = false
  #     username = ""
  #   }
  # ]

}

