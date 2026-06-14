# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_certificate_manager_trust_config             │
# └──────────────────────────────────────────────────────────────┘
resource "google_certificate_manager_trust_config" "this" {

  location         = ""     # string | required | The trust config location.
  name             = ""     # string | required | A user-defined name of the trust config. Trust config names …
  description      = ""     # string | optional | One or more paragraphs of text description of a trust config…
  id               = ""     # string | optional+computed
  labels           = {}     # map(string) | optional | Set of label tags associated with the trust config.  **Note*…
  project          = ""     # string | optional+computed

  # create_time      = ""     # string | computed | The creation timestamp of a TrustConfig.  A timestamp in RFC…
  # effective_labels = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # terraform_labels = {}     # map(string) | computed | The combination of labels configured directly on the resourc…
  # update_time      = ""     # string | computed | The last update timestamp of a TrustConfig.  A timestamp in …

  allowlisted_certificates { # list
    pem_certificate = ""     # string | required | PEM certificate that is allowlisted. The certificate can be …

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

  trust_stores { # list

    intermediate_cas { # list
      pem_certificate = ""     # string | optional+sensitive | PEM intermediate certificate used for building up paths for …

    }

    trust_anchors { # list
      pem_certificate = ""     # string | optional+sensitive | PEM root certificate of the PKI used for validation. Each ce…

    }

  }

}

