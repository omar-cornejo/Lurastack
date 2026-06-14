# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_config_remediation_configuration                │
# └──────────────────────────────────────────────────────────────┘
resource "aws_config_remediation_configuration" "this" {

  config_rule_name           = ""     # string | required
  target_id                  = ""     # string | required
  target_type                = ""     # string | required
  automatic                  = false  # bool | optional
  id                         = ""     # string | optional+computed
  maximum_automatic_attempts = 0      # number | optional
  resource_type              = ""     # string | optional
  retry_attempt_seconds      = 0      # number | optional
  target_version             = ""     # string | optional

  # arn                        = ""     # string | computed

  execution_controls { # list [0..1]

    ssm_controls { # list [0..1]
      concurrent_execution_rate_percentage = 0      # number | optional
      error_percentage                     = 0      # number | optional

    }

  }

  parameter { # list [0..25]
    name           = ""     # string | required
    resource_value = ""     # string | optional
    static_value   = ""     # string | optional
    static_values  = []     # list(string) | optional+computed

  }

}

