# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_tags_tag_value                               │
# └──────────────────────────────────────────────────────────────┘
resource "google_tags_tag_value" "this" {

  parent          = ""     # string | required | Input only. The resource name of the new TagValue's parent. …
  short_name      = ""     # string | required | Input only. User-assigned short name for TagValue. The short…
  description     = ""     # string | optional | User-assigned description of the TagValue. Must not exceed 2…
  id              = ""     # string | optional+computed

  # create_time     = ""     # string | computed | Output only. Creation time.  A timestamp in RFC3339 UTC "Zul…
  # name            = ""     # string | computed | The generated numeric id for the TagValue.
  # namespaced_name = ""     # string | computed | Output only. Namespaced name of the TagValue. Will be in the…
  # update_time     = ""     # string | computed | Output only. Update time. A timestamp in RFC3339 UTC "Zulu" …

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

