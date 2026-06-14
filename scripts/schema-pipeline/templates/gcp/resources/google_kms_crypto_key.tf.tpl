# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_kms_crypto_key                               │
# └──────────────────────────────────────────────────────────────┘
resource "google_kms_crypto_key" "this" {

  key_ring                      = ""     # string | required | The KeyRing that this key belongs to. Format: ''projects/{{p…
  name                          = ""     # string | required | The resource name for the CryptoKey.
  crypto_key_backend            = ""     # string | optional+computed | The resource name of the backend environment associated with…
  destroy_scheduled_duration    = ""     # string | optional+computed | The period of time that versions of this key spend in the DE…
  id                            = ""     # string | optional+computed
  import_only                   = false  # bool | optional+computed | Whether this key may contain imported versions only.
  labels                        = {}     # map(string) | optional | Labels with user-defined metadata to apply to this resource.…
  purpose                       = ""     # string | optional | The immutable purpose of this CryptoKey. See the [purpose re…
  rotation_period               = ""     # string | optional | Every time this period passes, generate a new CryptoKeyVersi…
  skip_initial_version_creation = false  # bool | optional | If set to true, the request will create a CryptoKey without …

  # effective_labels              = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # primary = [  # list(object)
  #   {
  #     name = ""
  #     state = ""
  #   }
  # ]
  # terraform_labels              = {}     # map(string) | computed | The combination of labels configured directly on the resourc…

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

  version_template { # list [0..1]
    algorithm        = ""     # string | required | The algorithm to use when creating a version based on this t…
    protection_level = ""     # string | optional | The protection level to use when creating a version based on…

  }

}

