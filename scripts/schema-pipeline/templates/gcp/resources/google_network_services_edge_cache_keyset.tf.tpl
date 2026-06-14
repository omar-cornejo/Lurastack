# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_network_services_edge_cache_keyset           │
# └──────────────────────────────────────────────────────────────┘
resource "google_network_services_edge_cache_keyset" "this" {

  name             = ""     # string | required | Name of the resource; provided by the client when the resour…
  description      = ""     # string | optional | A human-readable description of the resource.
  id               = ""     # string | optional+computed
  labels           = {}     # map(string) | optional | Set of label tags associated with the EdgeCache resource.  *…
  project          = ""     # string | optional+computed

  # effective_labels = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # terraform_labels = {}     # map(string) | computed | The combination of labels configured directly on the resourc…

  public_key { # list [0..3]
    id      = ""     # string | required | The ID of the public key. The ID must be 1-63 characters lon…
    managed = false  # bool | optional | Set to true to have the CDN automatically manage this public…
    value   = ""     # string | optional+sensitive | The base64-encoded value of the Ed25519 public key. The base…

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

  validation_shared_keys { # list [0..3]
    secret_version = ""     # string | required | The name of the secret version in Secret Manager.  The resou…

  }

}

