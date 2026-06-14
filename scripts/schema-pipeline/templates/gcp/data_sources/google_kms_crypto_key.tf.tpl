# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_kms_crypto_key                                   │
# └──────────────────────────────────────────────────────────────┘
data "google_kms_crypto_key" "this" {

  key_ring                      = ""     # string | required | The KeyRing that this key belongs to. Format: ''projects/{{p…
  name                          = ""     # string | required | The resource name for the CryptoKey.
  id                            = ""     # string | optional+computed

  # crypto_key_backend            = ""     # string | computed | The resource name of the backend environment associated with…
  # destroy_scheduled_duration    = ""     # string | computed | The period of time that versions of this key spend in the DE…
  # effective_labels              = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # import_only                   = false  # bool | computed | Whether this key may contain imported versions only.
  # labels                        = {}     # map(string) | computed | Labels with user-defined metadata to apply to this resource.…
  # primary = [  # list(object)
  #   {
  #     name = ""
  #     state = ""
  #   }
  # ]
  # purpose                       = ""     # string | computed | The immutable purpose of this CryptoKey. See the [purpose re…
  # rotation_period               = ""     # string | computed | Every time this period passes, generate a new CryptoKeyVersi…
  # skip_initial_version_creation = false  # bool | computed | If set to true, the request will create a CryptoKey without …
  # terraform_labels              = {}     # map(string) | computed | The combination of labels configured directly on the resourc…
  # version_template = [  # list(object)
  #   {
  #     algorithm = ""
  #     protection_level = ""
  #   }
  # ]

}

