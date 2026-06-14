# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_active_folder                                    │
# └──────────────────────────────────────────────────────────────┘
data "google_active_folder" "this" {

  display_name = ""     # string | required
  parent       = ""     # string | required
  api_method   = ""     # string | optional | Provides the REST method through which to find the folder. L…
  id           = ""     # string | optional+computed

  # name         = ""     # string | computed

}

