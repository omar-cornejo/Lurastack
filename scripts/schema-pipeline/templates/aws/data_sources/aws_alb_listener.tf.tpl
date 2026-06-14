# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_alb_listener                                        │
# └──────────────────────────────────────────────────────────────┘
data "aws_alb_listener" "this" {

  arn                   = ""     # string | optional+computed
  id                    = ""     # string | optional+computed
  load_balancer_arn     = ""     # string | optional+computed
  port                  = 0      # number | optional+computed
  tags                  = {}     # map(string) | optional+computed

  # alpn_policy           = ""     # string | computed
  # certificate_arn       = ""     # string | computed
  # default_action = [  # list(object)
  #   {
  #     authenticate_cognito = [  # list(object)
  #       {
  #         authentication_request_extra_params = {}  # map(string)
  #         on_unauthenticated_request = ""
  #         scope = ""
  #         session_cookie_name = ""
  #         session_timeout = 0
  #         user_pool_arn = ""
  #         user_pool_client_id = ""
  #         user_pool_domain = ""
  #       }
  #     ]
  #     authenticate_oidc = [  # list(object)
  #       {
  #         authentication_request_extra_params = {}  # map(string)
  #         authorization_endpoint = ""
  #         client_id = ""
  #         client_secret = ""
  #         issuer = ""
  #         on_unauthenticated_request = ""
  #         scope = ""
  #         session_cookie_name = ""
  #         session_timeout = 0
  #         token_endpoint = ""
  #         user_info_endpoint = ""
  #       }
  #     ]
  #     fixed_response = [  # list(object)
  #       {
  #         content_type = ""
  #         message_body = ""
  #         status_code = ""
  #       }
  #     ]
  #     forward = [  # list(object)
  #       {
  #         stickiness = [  # list(object)
  #           {
  #             duration = 0
  #             enabled = false
  #           }
  #         ]
  #         target_group = [  # set(object)
  #           {
  #             arn = ""
  #             weight = 0
  #           }
  #         ]
  #       }
  #     ]
  #     order = 0
  #     redirect = [  # list(object)
  #       {
  #         host = ""
  #         path = ""
  #         port = ""
  #         protocol = ""
  #         query = ""
  #         status_code = ""
  #       }
  #     ]
  #     target_group_arn = ""
  #     type = ""
  #   }
  # ]
  # mutual_authentication = [  # list(object)
  #   {
  #     advertise_trust_store_ca_names = ""
  #     ignore_client_certificate_expiry = false
  #     mode = ""
  #     trust_store_arn = ""
  #   }
  # ]
  # protocol              = ""     # string | computed
  # ssl_policy            = ""     # string | computed

  timeouts { # single
    read = ""     # string | optional

  }

}

