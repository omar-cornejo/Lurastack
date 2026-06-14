# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_paymentcryptography_key                         │
# └──────────────────────────────────────────────────────────────┘
resource "aws_paymentcryptography_key" "this" {

  exportable                = false  # bool | required
  deletion_window_in_days   = 0      # number | optional+computed
  enabled                   = false  # bool | optional+computed
  key_check_value_algorithm = ""     # string | optional+computed
  tags                      = {}     # map(string) | optional

  # arn                       = ""     # string | computed
  # id                        = ""     # string | computed
  # key_check_value           = ""     # string | computed
  # key_origin                = ""     # string | computed
  # key_state                 = ""     # string | computed
  # tags_all                  = {}     # map(string) | computed

  key_attributes { # single
    key_algorithm = ""     # string | required
    key_class     = ""     # string | required
    key_usage     = ""     # string | required

    key_modes_of_use { # single
      decrypt         = false  # bool | optional+computed
      derive_key      = false  # bool | optional+computed
      encrypt         = false  # bool | optional+computed
      generate        = false  # bool | optional+computed
      no_restrictions = false  # bool | optional+computed
      sign            = false  # bool | optional+computed
      unwrap          = false  # bool | optional+computed
      verify          = false  # bool | optional+computed
      wrap            = false  # bool | optional+computed

    }

  }

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    delete = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    update = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}

