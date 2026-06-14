# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_tags_tag_keys                                    │
# └──────────────────────────────────────────────────────────────┘
data "google_tags_tag_keys" "this" {

  parent = ""     # string | required
  id     = ""     # string | optional+computed

  # keys = [  # list(object)
  #   {
  #     create_time = ""
  #     description = ""
  #     name = ""
  #     namespaced_name = ""
  #     parent = ""
  #     purpose = ""
  #     purpose_data = {}  # map(string)
  #     short_name = ""
  #     update_time = ""
  #   }
  # ]

}

