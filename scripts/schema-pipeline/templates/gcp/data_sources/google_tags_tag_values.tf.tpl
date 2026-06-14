# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_tags_tag_values                                  │
# └──────────────────────────────────────────────────────────────┘
data "google_tags_tag_values" "this" {

  parent = ""     # string | required
  id     = ""     # string | optional+computed

  # values = [  # list(object)
  #   {
  #     create_time = ""
  #     description = ""
  #     name = ""
  #     namespaced_name = ""
  #     parent = ""
  #     short_name = ""
  #     update_time = ""
  #   }
  # ]

}

