# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_alb_listener_rule                               │
# └──────────────────────────────────────────────────────────────┘
resource "aws_alb_listener_rule" "this" {

  listener_arn = ""     # string | required
  id           = ""     # string | optional+computed
  priority     = 0      # number | optional+computed
  tags         = {}     # map(string) | optional
  tags_all     = {}     # map(string) | optional+computed

  # arn          = ""     # string | computed

  action { # list [1..*]
    type             = ""     # string | required
    order            = 0      # number | optional+computed
    target_group_arn = ""     # string | optional

    authenticate_cognito { # list [0..1]
      user_pool_arn                       = ""     # string | required
      user_pool_client_id                 = ""     # string | required
      user_pool_domain                    = ""     # string | required
      authentication_request_extra_params = {}     # map(string) | optional
      on_unauthenticated_request          = ""     # string | optional+computed
      scope                               = ""     # string | optional
      session_cookie_name                 = ""     # string | optional
      session_timeout                     = 0      # number | optional

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
      scope                               = ""     # string | optional
      session_cookie_name                 = ""     # string | optional
      session_timeout                     = 0      # number | optional

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

  condition { # set [1..*]

    host_header { # list [0..1]
      values = []     # set(string) | required

    }

    http_header { # list [0..1]
      http_header_name = ""     # string | required
      values           = []     # set(string) | required

    }

    http_request_method { # list [0..1]
      values = []     # set(string) | required

    }

    path_pattern { # list [0..1]
      values = []     # set(string) | required

    }

    query_string { # set
      value = ""     # string | required
      key   = ""     # string | optional

    }

    source_ip { # list [0..1]
      values = []     # set(string) | required

    }

  }

}

