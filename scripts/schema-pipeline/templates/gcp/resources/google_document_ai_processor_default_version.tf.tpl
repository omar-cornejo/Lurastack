# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_document_ai_processor_default_version        │
# └──────────────────────────────────────────────────────────────┘
resource "google_document_ai_processor_default_version" "this" {

  processor = ""     # string | required | The processor to set the version on.
  version   = ""     # string | required | The version to set. Using 'stable' or 'rc' will cause the AP…
  id        = ""     # string | optional+computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

