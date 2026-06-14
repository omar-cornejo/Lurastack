# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_tags_tag_binding                             │
# └──────────────────────────────────────────────────────────────┘
resource "google_tags_tag_binding" "this" {

  parent    = ""     # string | required | The full resource name of the resource the TagValue is bound…
  tag_value = ""     # string | required | The TagValue of the TagBinding. Must be of the form tagValue…
  id        = ""     # string | optional+computed

  # name      = ""     # string | computed | The generated id for the TagBinding. This is a string of the…

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

