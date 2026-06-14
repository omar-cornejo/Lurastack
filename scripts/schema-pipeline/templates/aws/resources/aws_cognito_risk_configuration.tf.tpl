# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_cognito_risk_configuration                      │
# └──────────────────────────────────────────────────────────────┘
resource "aws_cognito_risk_configuration" "this" {

  user_pool_id = ""     # string | required
  client_id    = ""     # string | optional
  id           = ""     # string | optional+computed

  account_takeover_risk_configuration { # list [0..1]

    actions { # list [1..1]

      high_action { # list [0..1]
        event_action = ""     # string | required
        notify       = false  # bool | required

      }

      low_action { # list [0..1]
        event_action = ""     # string | required
        notify       = false  # bool | required

      }

      medium_action { # list [0..1]
        event_action = ""     # string | required
        notify       = false  # bool | required

      }

    }

    notify_configuration { # list [1..1]
      source_arn = ""     # string | required
      from       = ""     # string | optional
      reply_to   = ""     # string | optional

      block_email { # list [0..1]
        html_body = ""     # string | required
        subject   = ""     # string | required
        text_body = ""     # string | required

      }

      mfa_email { # list [0..1]
        html_body = ""     # string | required
        subject   = ""     # string | required
        text_body = ""     # string | required

      }

      no_action_email { # list [0..1]
        html_body = ""     # string | required
        subject   = ""     # string | required
        text_body = ""     # string | required

      }

    }

  }

  compromised_credentials_risk_configuration { # list [0..1]
    event_filter = []     # set(string) | optional+computed

    actions { # list [1..1]
      event_action = ""     # string | required

    }

  }

  risk_exception_configuration { # list [0..1]
    blocked_ip_range_list = []     # set(string) | optional
    skipped_ip_range_list = []     # set(string) | optional

  }

}

