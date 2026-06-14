# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_billing_account                                  │
# └──────────────────────────────────────────────────────────────┘
data "google_billing_account" "this" {

  billing_account = ""     # string | optional
  display_name    = ""     # string | optional+computed
  id              = ""     # string | optional+computed
  lookup_projects = false  # bool | optional
  open            = false  # bool | optional+computed

  # name            = ""     # string | computed
  # project_ids     = []     # set(string) | computed

}

