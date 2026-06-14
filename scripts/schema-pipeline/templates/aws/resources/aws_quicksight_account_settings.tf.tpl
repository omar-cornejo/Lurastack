# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_quicksight_account_settings                     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_quicksight_account_settings" "this" {

  aws_account_id                 = ""     # string | optional+computed
  default_namespace              = ""     # string | optional+computed
  termination_protection_enabled = false  # bool | optional+computed

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    update = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}

