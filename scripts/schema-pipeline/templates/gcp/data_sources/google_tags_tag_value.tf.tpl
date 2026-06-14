# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_tags_tag_value                                   │
# └──────────────────────────────────────────────────────────────┘
data "google_tags_tag_value" "this" {

  parent          = ""     # string | required
  short_name      = ""     # string | required

  # create_time     = ""     # string | computed
  # description     = ""     # string | computed
  # id              = ""     # string | computed
  # name            = ""     # string | computed
  # namespaced_name = ""     # string | computed
  # update_time     = ""     # string | computed

}

