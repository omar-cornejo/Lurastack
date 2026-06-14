# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_billing_subaccount                           │
# └──────────────────────────────────────────────────────────────┘
resource "google_billing_subaccount" "this" {

  display_name           = ""     # string | required
  master_billing_account = ""     # string | required
  deletion_policy        = ""     # string | optional
  id                     = ""     # string | optional+computed

  # billing_account_id     = ""     # string | computed
  # name                   = ""     # string | computed
  # open                   = false  # bool | computed

}

