# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_pinpointsmsvoicev2_phone_number                 │
# └──────────────────────────────────────────────────────────────┘
resource "aws_pinpointsmsvoicev2_phone_number" "this" {

  iso_country_code              = ""     # string | required
  message_type                  = ""     # string | required
  number_capabilities           = []     # set(string) | required
  number_type                   = ""     # string | required
  deletion_protection_enabled   = false  # bool | optional+computed
  opt_out_list_name             = ""     # string | optional+computed
  registration_id               = ""     # string | optional
  self_managed_opt_outs_enabled = false  # bool | optional+computed
  tags                          = {}     # map(string) | optional
  two_way_channel_arn           = ""     # string | optional
  two_way_channel_enabled       = false  # bool | optional+computed
  two_way_channel_role          = ""     # string | optional

  # arn                           = ""     # string | computed
  # id                            = ""     # string | computed
  # monthly_leasing_price         = ""     # string | computed
  # phone_number                  = ""     # string | computed
  # tags_all                      = {}     # map(string) | computed

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    delete = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    update = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}

