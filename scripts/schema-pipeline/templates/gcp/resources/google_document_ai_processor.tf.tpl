# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_document_ai_processor                        │
# └──────────────────────────────────────────────────────────────┘
resource "google_document_ai_processor" "this" {

  display_name = ""     # string | required | The display name. Must be unique.
  location     = ""     # string | required | The location of the resource.
  type         = ""     # string | required | The type of processor. For possible types see the [official …
  id           = ""     # string | optional+computed
  kms_key_name = ""     # string | optional | The KMS key used for encryption/decryption in CMEK scenarios…
  project      = ""     # string | optional+computed

  # name         = ""     # string | computed | The resource name of the processor.

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

