# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_storage_bucket_objects                           │
# └──────────────────────────────────────────────────────────────┘
data "google_storage_bucket_objects" "this" {

  bucket         = ""     # string | required
  id             = ""     # string | optional+computed
  match_glob     = ""     # string | optional
  prefix         = ""     # string | optional

  # bucket_objects = [  # list(object)
  #   {
  #     content_type = ""
  #     media_link = ""
  #     name = ""
  #     self_link = ""
  #     storage_class = ""
  #   }
  # ]

}

