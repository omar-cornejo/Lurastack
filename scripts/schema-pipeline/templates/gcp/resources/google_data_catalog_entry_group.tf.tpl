# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_data_catalog_entry_group                     │
# └──────────────────────────────────────────────────────────────┘
resource "google_data_catalog_entry_group" "this" {

  entry_group_id = ""     # string | required | The id of the entry group to create. The id must begin with …
  description    = ""     # string | optional | Entry group description, which can consist of several senten…
  display_name   = ""     # string | optional | A short name to identify the entry group, for example, "anal…
  id             = ""     # string | optional+computed
  project        = ""     # string | optional+computed
  region         = ""     # string | optional+computed | EntryGroup location region.

  # name           = ""     # string | computed | The resource name of the entry group in URL format. Example:…

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

