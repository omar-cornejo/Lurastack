# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_healthcare_consent_store                     │
# └──────────────────────────────────────────────────────────────┘
resource "google_healthcare_consent_store" "this" {

  dataset                         = ""     # string | required | Identifies the dataset addressed by this request. Must be in…
  name                            = ""     # string | required | The name of this ConsentStore, for example: "consent1"
  default_consent_ttl             = ""     # string | optional | Default time to live for consents in this store. Must be at …
  enable_consent_create_on_update = false  # bool | optional | If true, [consents.patch] [google.cloud.healthcare.v1.consen…
  id                              = ""     # string | optional+computed
  labels                          = {}     # map(string) | optional | User-supplied key-value pairs used to organize Consent store…

  # effective_labels                = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # terraform_labels                = {}     # map(string) | computed | The combination of labels configured directly on the resourc…

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

