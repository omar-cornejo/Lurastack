# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_binary_authorization_attestor                │
# └──────────────────────────────────────────────────────────────┘
resource "google_binary_authorization_attestor" "this" {

  name        = ""     # string | required | The resource name.
  description = ""     # string | optional | A descriptive comment. This field may be updated. The field …
  id          = ""     # string | optional+computed
  project     = ""     # string | optional+computed

  attestation_authority_note { # list [1..1]
    note_reference                   = ""     # string | required | The resource name of a ATTESTATION_AUTHORITY Note, created b…

    # delegation_service_account_email = ""     # string | computed | This field will contain the service account email address th…

    public_keys { # list
      ascii_armored_pgp_public_key = ""     # string | optional | ASCII-armored representation of a PGP public key, as the ent…
      comment                      = ""     # string | optional | A descriptive comment. This field may be updated.
      id                           = ""     # string | optional+computed | The ID of this public key. Signatures verified by BinAuthz m…

      pkix_public_key { # list [0..1]
        public_key_pem      = ""     # string | optional | A PEM-encoded public key, as described in 'https://tools.iet…
        signature_algorithm = ""     # string | optional | The signature algorithm used to verify a message against a s…

      }

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

