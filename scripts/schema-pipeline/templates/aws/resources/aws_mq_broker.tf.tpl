# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_mq_broker                                       │
# └──────────────────────────────────────────────────────────────┘
resource "aws_mq_broker" "this" {

  broker_name                         = ""     # string | required
  engine_type                         = ""     # string | required
  engine_version                      = ""     # string | required
  host_instance_type                  = ""     # string | required
  apply_immediately                   = false  # bool | optional
  authentication_strategy             = ""     # string | optional+computed
  auto_minor_version_upgrade          = false  # bool | optional
  data_replication_mode               = ""     # string | optional+computed
  data_replication_primary_broker_arn = ""     # string | optional
  deployment_mode                     = ""     # string | optional
  id                                  = ""     # string | optional+computed
  publicly_accessible                 = false  # bool | optional
  security_groups                     = []     # set(string) | optional
  storage_type                        = ""     # string | optional+computed
  subnet_ids                          = []     # set(string) | optional+computed
  tags                                = {}     # map(string) | optional
  tags_all                            = {}     # map(string) | optional+computed

  # arn                                 = ""     # string | computed
  # instances = [  # list(object)
  #   {
  #     console_url = ""
  #     endpoints = []  # list(string)
  #     ip_address = ""
  #   }
  # ]
  # pending_data_replication_mode       = ""     # string | computed

  configuration { # list [0..1]
    id       = ""     # string | optional+computed
    revision = 0      # number | optional+computed

  }

  encryption_options { # list [0..1]
    kms_key_id        = ""     # string | optional+computed
    use_aws_owned_key = false  # bool | optional

  }

  ldap_server_metadata { # list [0..1]
    hosts                    = []     # list(string) | optional
    role_base                = ""     # string | optional
    role_name                = ""     # string | optional
    role_search_matching     = ""     # string | optional
    role_search_subtree      = false  # bool | optional
    service_account_password = ""     # string | optional+sensitive
    service_account_username = ""     # string | optional
    user_base                = ""     # string | optional
    user_role_name           = ""     # string | optional
    user_search_matching     = ""     # string | optional
    user_search_subtree      = false  # bool | optional

  }

  logs { # list [0..1]
    audit   = ""     # string | optional
    general = false  # bool | optional

  }

  maintenance_window_start_time { # list [0..1]
    day_of_week = ""     # string | required
    time_of_day = ""     # string | required
    time_zone   = ""     # string | required

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

  user { # set [1..*]
    password         = ""     # string | required+sensitive
    username         = ""     # string | required
    console_access   = false  # bool | optional
    groups           = []     # set(string) | optional
    replication_user = false  # bool | optional

  }

}

