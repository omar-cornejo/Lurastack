# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_folders                                          │
# └──────────────────────────────────────────────────────────────┘
data "google_folders" "this" {

  parent_id = ""     # string | required
  id        = ""     # string | optional+computed

  # folders = [  # list(object)
  #   {
  #     create_time = ""
  #     delete_time = ""
  #     display_name = ""
  #     etag = ""
  #     name = ""
  #     parent = ""
  #     state = ""
  #     update_time = ""
  #   }
  # ]

}

