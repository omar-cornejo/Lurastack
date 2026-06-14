# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_account_region                                  │
# └──────────────────────────────────────────────────────────────┘
resource "aws_account_region" "this" {

  enabled     = false  # bool | required
  region_name = ""     # string | required
  account_id  = ""     # string | optional
  id          = ""     # string | optional+computed

  # opt_status  = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    update = ""     # string | optional

  }

}

