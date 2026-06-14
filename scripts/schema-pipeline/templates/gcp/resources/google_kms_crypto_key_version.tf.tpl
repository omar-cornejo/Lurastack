# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_kms_crypto_key_version                       │
# └──────────────────────────────────────────────────────────────┘
resource "google_kms_crypto_key_version" "this" {

  crypto_key       = ""     # string | required | The name of the cryptoKey associated with the CryptoKeyVersi…
  id               = ""     # string | optional+computed
  state            = ""     # string | optional+computed | The current state of the CryptoKeyVersion. Possible values: …

  # algorithm        = ""     # string | computed | The CryptoKeyVersionAlgorithm that this CryptoKeyVersion sup…
  # attestation = [  # list(object)
  #   {
  #     cert_chains = [  # list(object)
  #       {
  #         cavium_certs = []  # list(string)
  #         google_card_certs = []  # list(string)
  #         google_partition_certs = []  # list(string)
  #       }
  #     ]
  #     content = ""
  #     external_protection_level_options = [  # list(object)
  #       {
  #         ekm_connection_key_path = ""
  #         external_key_uri = ""
  #       }
  #     ]
  #     format = ""
  #   }
  # ]
  # generate_time    = ""     # string | computed | The time this CryptoKeyVersion key material was generated
  # name             = ""     # string | computed | The resource name for this CryptoKeyVersion.
  # protection_level = ""     # string | computed | The ProtectionLevel describing how crypto operations are per…

  external_protection_level_options { # list [0..1]
    ekm_connection_key_path = ""     # string | optional | The path to the external key material on the EKM when using …
    external_key_uri        = ""     # string | optional | The URI for an external resource that this CryptoKeyVersion …

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

