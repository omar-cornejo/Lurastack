# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_storage_buckets                                  │
# └──────────────────────────────────────────────────────────────┘
data "google_storage_buckets" "this" {

  id      = ""     # string | optional+computed
  prefix  = ""     # string | optional
  project = ""     # string | optional

  # buckets = [  # list(object)
  #   {
  #     labels = {}  # map(string)
  #     location = ""
  #     name = ""
  #     self_link = ""
  #     storage_class = ""
  #   }
  # ]

}

