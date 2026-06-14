# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_lb_listener                                     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_lb_listener" "this" {

  load_balancer_arn                                                     = ""     # string | required
  alpn_policy                                                           = ""     # string | optional
  certificate_arn                                                       = ""     # string | optional
  id                                                                    = ""     # string | optional+computed
  port                                                                  = 0      # number | optional
  protocol                                                              = ""     # string | optional+computed
  routing_http_request_x_amzn_mtls_clientcert_header_name               = ""     # string | optional+computed
  routing_http_request_x_amzn_mtls_clientcert_issuer_header_name        = ""     # string | optional+computed
  routing_http_request_x_amzn_mtls_clientcert_leaf_header_name          = ""     # string | optional+computed
  routing_http_request_x_amzn_mtls_clientcert_serial_number_header_name = ""     # string | optional+computed
  routing_http_request_x_amzn_mtls_clientcert_subject_header_name       = ""     # string | optional+computed
  routing_http_request_x_amzn_mtls_clientcert_validity_header_name      = ""     # string | optional+computed
  routing_http_request_x_amzn_tls_cipher_suite_header_name              = ""     # string | optional+computed
  routing_http_request_x_amzn_tls_version_header_name                   = ""     # string | optional+computed
  routing_http_response_access_control_allow_credentials_header_value   = ""     # string | optional+computed
  routing_http_response_access_control_allow_headers_header_value       = ""     # string | optional+computed
  routing_http_response_access_control_allow_methods_header_value       = ""     # string | optional+computed
  routing_http_response_access_control_allow_origin_header_value        = ""     # string | optional+computed
  routing_http_response_access_control_expose_headers_header_value      = ""     # string | optional+computed
  routing_http_response_access_control_max_age_header_value             = ""     # string | optional+computed
  routing_http_response_content_security_policy_header_value            = ""     # string | optional+computed
  routing_http_response_server_enabled                                  = false  # bool | optional+computed
  routing_http_response_strict_transport_security_header_value          = ""     # string | optional+computed
  routing_http_response_x_content_type_options_header_value             = ""     # string | optional+computed
  routing_http_response_x_frame_options_header_value                    = ""     # string | optional+computed
  ssl_policy                                                            = ""     # string | optional+computed
  tags                                                                  = {}     # map(string) | optional
  tags_all                                                              = {}     # map(string) | optional+computed
  tcp_idle_timeout_seconds                                              = 0      # number | optional+computed

  # arn                                                                   = ""     # string | computed

  default_action { # list [1..*]
    type             = ""     # string | required
    order            = 0      # number | optional+computed
    target_group_arn = ""     # string | optional

    authenticate_cognito { # list [0..1]
      user_pool_arn                       = ""     # string | required
      user_pool_client_id                 = ""     # string | required
      user_pool_domain                    = ""     # string | required
      authentication_request_extra_params = {}     # map(string) | optional
      on_unauthenticated_request          = ""     # string | optional+computed
      scope                               = ""     # string | optional+computed
      session_cookie_name                 = ""     # string | optional+computed
      session_timeout                     = 0      # number | optional+computed

    }

    authenticate_oidc { # list [0..1]
      authorization_endpoint              = ""     # string | required
      client_id                           = ""     # string | required
      client_secret                       = ""     # string | required+sensitive
      issuer                              = ""     # string | required
      token_endpoint                      = ""     # string | required
      user_info_endpoint                  = ""     # string | required
      authentication_request_extra_params = {}     # map(string) | optional
      on_unauthenticated_request          = ""     # string | optional+computed
      scope                               = ""     # string | optional+computed
      session_cookie_name                 = ""     # string | optional+computed
      session_timeout                     = 0      # number | optional+computed

    }

    fixed_response { # list [0..1]
      content_type = ""     # string | required
      message_body = ""     # string | optional
      status_code  = ""     # string | optional+computed

    }

    forward { # list [0..1]

      stickiness { # list [0..1]
        duration = 0      # number | required
        enabled  = false  # bool | optional

      }

      target_group { # set [1..5]
        arn    = ""     # string | required
        weight = 0      # number | optional

      }

    }

    redirect { # list [0..1]
      status_code = ""     # string | required
      host        = ""     # string | optional
      path        = ""     # string | optional
      port        = ""     # string | optional
      protocol    = ""     # string | optional
      query       = ""     # string | optional

    }

  }

  mutual_authentication { # list [0..1]
    mode                             = ""     # string | required
    advertise_trust_store_ca_names   = ""     # string | optional+computed
    ignore_client_certificate_expiry = false  # bool | optional
    trust_store_arn                  = ""     # string | optional

  }

  timeouts { # single
    create = ""     # string | optional
    update = ""     # string | optional

  }

}

