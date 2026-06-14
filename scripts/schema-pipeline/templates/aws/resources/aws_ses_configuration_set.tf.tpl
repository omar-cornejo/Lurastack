# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ses_configuration_set                           │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ses_configuration_set" "this" {

  name                       = ""     # string | required
  id                         = ""     # string | optional+computed
  reputation_metrics_enabled = false  # bool | optional
  sending_enabled            = false  # bool | optional

  # arn                        = ""     # string | computed
  # last_fresh_start           = ""     # string | computed

  delivery_options { # list [0..1]
    tls_policy = ""     # string | optional

  }

  tracking_options { # list [0..1]
    custom_redirect_domain = ""     # string | optional

  }

}

