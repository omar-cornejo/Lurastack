# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_compute_addresses                                │
# └──────────────────────────────────────────────────────────────┘
data "google_compute_addresses" "this" {

  filter    = ""     # string | optional | Filter sets the optional parameter "filter": A filter expres…
  id        = ""     # string | optional+computed
  project   = ""     # string | optional+computed | The google project in which addresses are listed. Defaults t…
  region    = ""     # string | optional | Region that should be considered to search addresses. All re…

  # addresses = [  # list(object)
  #   {
  #     address = ""
  #     address_type = ""
  #     description = ""
  #     name = ""
  #     region = ""
  #     self_link = ""
  #     status = ""
  #   }
  # ]

}

