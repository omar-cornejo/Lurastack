# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_organization                                     │
# └──────────────────────────────────────────────────────────────┘
data "google_organization" "this" {

  domain                = ""     # string | optional+computed
  id                    = ""     # string | optional+computed
  organization          = ""     # string | optional

  # create_time           = ""     # string | computed
  # directory_customer_id = ""     # string | computed
  # lifecycle_state       = ""     # string | computed
  # name                  = ""     # string | computed
  # org_id                = ""     # string | computed

}

