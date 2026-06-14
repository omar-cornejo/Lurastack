# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_securityhub_configuration_policy                │
# └──────────────────────────────────────────────────────────────┘
resource "aws_securityhub_configuration_policy" "this" {

  name        = ""     # string | required
  description = ""     # string | optional
  id          = ""     # string | optional+computed

  # arn         = ""     # string | computed

  configuration_policy { # list [1..1]
    service_enabled       = false  # bool | required
    enabled_standard_arns = []     # set(string) | optional

    security_controls_configuration { # list [0..1]
      disabled_control_identifiers = []     # set(string) | optional
      enabled_control_identifiers  = []     # set(string) | optional

      security_control_custom_parameter { # list
        security_control_id = ""     # string | required

        parameter { # set [1..*]
          name       = ""     # string | required
          value_type = ""     # string | required

          bool { # list [0..1]
            value = false  # bool | required

          }

          double { # list [0..1]
            value = 0      # number | required

          }

          enum { # list [0..1]
            value = ""     # string | required

          }

          enum_list { # list [0..1]
            value = []     # list(string) | required

          }

          int { # list [0..1]
            value = 0      # number | required

          }

          int_list { # list [0..1]
            value = []     # list(number) | required

          }

          string { # list [0..1]
            value = ""     # string | required

          }

          string_list { # list [0..1]
            value = []     # list(string) | required

          }

        }

      }

    }

  }

}

