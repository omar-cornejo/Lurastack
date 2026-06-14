# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_tags_tag_key                                 │
# └──────────────────────────────────────────────────────────────┘
resource "google_tags_tag_key" "this" {

  parent          = ""     # string | required | Input only. The resource name of the new TagKey's parent. Mu…
  short_name      = ""     # string | required | Input only. The user friendly name for a TagKey. The short n…
  description     = ""     # string | optional | User-assigned description of the TagKey. Must not exceed 256…
  id              = ""     # string | optional+computed
  purpose         = ""     # string | optional | Optional. A purpose cannot be changed once set.  A purpose d…
  purpose_data    = {}     # map(string) | optional | Optional. Purpose data cannot be changed once set.  Purpose …

  # create_time     = ""     # string | computed | Output only. Creation time.  A timestamp in RFC3339 UTC "Zul…
  # name            = ""     # string | computed | The generated numeric id for the TagKey.
  # namespaced_name = ""     # string | computed | Output only. Namespaced name of the TagKey.
  # update_time     = ""     # string | computed | Output only. Update time.  A timestamp in RFC3339 UTC "Zulu"…

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

