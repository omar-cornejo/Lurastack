# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_transfer_server                                 │
# └──────────────────────────────────────────────────────────────┘
resource "aws_transfer_server" "this" {

  certificate                      = ""     # string | optional
  directory_id                     = ""     # string | optional
  domain                           = ""     # string | optional
  endpoint_type                    = ""     # string | optional
  force_destroy                    = false  # bool | optional
  function                         = ""     # string | optional
  host_key                         = ""     # string | optional+sensitive
  id                               = ""     # string | optional+computed
  identity_provider_type           = ""     # string | optional
  invocation_role                  = ""     # string | optional
  logging_role                     = ""     # string | optional
  post_authentication_login_banner = ""     # string | optional+sensitive
  pre_authentication_login_banner  = ""     # string | optional+sensitive
  protocols                        = []     # set(string) | optional+computed
  security_policy_name             = ""     # string | optional
  sftp_authentication_methods      = ""     # string | optional+computed
  structured_log_destinations      = []     # set(string) | optional | This is a set of arns of destinations that will receive stru…
  tags                             = {}     # map(string) | optional
  tags_all                         = {}     # map(string) | optional+computed
  url                              = ""     # string | optional

  # arn                              = ""     # string | computed
  # endpoint                         = ""     # string | computed
  # host_key_fingerprint             = ""     # string | computed

  endpoint_details { # list [0..1]
    address_allocation_ids = []     # set(string) | optional
    security_group_ids     = []     # set(string) | optional+computed
    subnet_ids             = []     # set(string) | optional
    vpc_endpoint_id        = ""     # string | optional+computed
    vpc_id                 = ""     # string | optional

  }

  protocol_details { # list [0..1]
    as2_transports              = []     # set(string) | optional+computed
    passive_ip                  = ""     # string | optional+computed
    set_stat_option             = ""     # string | optional+computed
    tls_session_resumption_mode = ""     # string | optional+computed

  }

  s3_storage_options { # list [0..1]
    directory_listing_optimization = ""     # string | optional+computed

  }

  workflow_details { # list [0..1]

    on_partial_upload { # list [0..1]
      execution_role = ""     # string | required
      workflow_id    = ""     # string | required

    }

    on_upload { # list [0..1]
      execution_role = ""     # string | required
      workflow_id    = ""     # string | required

    }

  }

}

