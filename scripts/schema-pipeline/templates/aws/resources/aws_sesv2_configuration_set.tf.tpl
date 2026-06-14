# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_sesv2_configuration_set                         │
# └──────────────────────────────────────────────────────────────┘
resource "aws_sesv2_configuration_set" "this" {

  configuration_set_name = ""     # string | required
  id                     = ""     # string | optional+computed
  tags                   = {}     # map(string) | optional
  tags_all               = {}     # map(string) | optional+computed

  # arn                    = ""     # string | computed

  delivery_options { # list [0..1]
    max_delivery_seconds = 0      # number | optional
    sending_pool_name    = ""     # string | optional
    tls_policy           = ""     # string | optional

  }

  reputation_options { # list [0..1]
    reputation_metrics_enabled = false  # bool | optional+computed

    # last_fresh_start           = ""     # string | computed

  }

  sending_options { # list [0..1]
    sending_enabled = false  # bool | optional+computed

  }

  suppression_options { # list [0..1]
    suppressed_reasons = []     # list(string) | optional

  }

  tracking_options { # list [0..1]
    custom_redirect_domain = ""     # string | required
    https_policy           = ""     # string | optional

  }

  vdm_options { # list [0..1]

    dashboard_options { # list [0..1]
      engagement_metrics = ""     # string | optional

    }

    guardian_options { # list [0..1]
      optimized_shared_delivery = ""     # string | optional

    }

  }

}

