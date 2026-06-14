# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_lb_listener_rule                                    │
# └──────────────────────────────────────────────────────────────┘
data "aws_lb_listener_rule" "this" {

  arn          = ""     # string | optional+computed
  listener_arn = ""     # string | optional+computed
  priority     = 0      # number | optional+computed

  # tags         = {}     # map(string) | computed

  action { # list

    # order = 0      # number | computed
    # type  = ""     # string | computed

    authenticate_cognito { # single

      # authentication_request_extra_params = {}     # map(string) | computed
      # on_unauthenticated_request          = ""     # string | computed
      # scope                               = ""     # string | computed
      # session_cookie_name                 = ""     # string | computed
      # session_timeout                     = 0      # number | computed
      # user_pool_arn                       = ""     # string | computed
      # user_pool_client_id                 = ""     # string | computed
      # user_pool_domain                    = ""     # string | computed

    }

    authenticate_oidc { # single

      # authentication_request_extra_params = {}     # map(string) | computed
      # authorization_endpoint              = ""     # string | computed
      # client_id                           = ""     # string | computed
      # issuer                              = ""     # string | computed
      # on_unauthenticated_request          = ""     # string | computed
      # scope                               = ""     # string | computed
      # session_cookie_name                 = ""     # string | computed
      # session_timeout                     = 0      # number | computed
      # token_endpoint                      = ""     # string | computed
      # user_info_endpoint                  = ""     # string | computed

    }

    fixed_response { # single

      # content_type = ""     # string | computed
      # message_body = ""     # string | computed
      # status_code  = ""     # string | computed

    }

    forward { # single

      stickiness { # single

        # duration = 0      # number | computed
        # enabled  = false  # bool | computed

      }

      target_group { # set

        # arn    = ""     # string | computed
        # weight = 0      # number | computed

      }

    }

    redirect { # single

      # host        = ""     # string | computed
      # path        = ""     # string | computed
      # port        = ""     # string | computed
      # protocol    = ""     # string | computed
      # query       = ""     # string | computed
      # status_code = ""     # string | computed

    }

  }

  condition { # set

    host_header { # single

      # values = []     # set(string) | computed

    }

    http_header { # single

      # http_header_name = ""     # string | computed
      # values           = []     # set(string) | computed

    }

    http_request_method { # single

      # values = []     # set(string) | computed

    }

    path_pattern { # single

      # values = []     # set(string) | computed

    }

    query_string { # single

      values { # set

        # key   = ""     # string | computed
        # value = ""     # string | computed

      }

    }

    source_ip { # single

      # values = []     # set(string) | computed

    }

  }

}

