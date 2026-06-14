# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_container_analysis_occurrence                │
# └──────────────────────────────────────────────────────────────┘
resource "google_container_analysis_occurrence" "this" {

  note_name    = ""     # string | required | The analysis note associated with this occurrence, in the fo…
  resource_uri = ""     # string | required | Required. Immutable. A URI that represents the resource for …
  id           = ""     # string | optional+computed
  project      = ""     # string | optional+computed
  remediation  = ""     # string | optional | A description of actions that can be taken to remedy the not…

  # create_time  = ""     # string | computed | The time when the repository was created.
  # kind         = ""     # string | computed | The note kind which explicitly denotes which of the occurren…
  # name         = ""     # string | computed | The name of the occurrence.
  # update_time  = ""     # string | computed | The time when the repository was last updated.

  attestation { # list [1..1]
    serialized_payload = ""     # string | required | The serialized payload that is verified by one or more signa…

    signatures { # set [1..*]
      public_key_id = ""     # string | required | The identifier for the public key that verifies this signatu…
      signature     = ""     # string | optional | The content of the signature, an opaque bytestring. The payl…

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

