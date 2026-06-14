# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_folder                                           │
# └──────────────────────────────────────────────────────────────┘
data "google_folder" "this" {

  folder              = ""     # string | required
  id                  = ""     # string | optional+computed
  lookup_organization = false  # bool | optional

  # create_time         = ""     # string | computed
  # display_name        = ""     # string | computed
  # folder_id           = ""     # string | computed
  # lifecycle_state     = ""     # string | computed
  # name                = ""     # string | computed
  # organization        = ""     # string | computed
  # parent              = ""     # string | computed

}

