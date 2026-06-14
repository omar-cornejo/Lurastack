# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_gke_hub_membership                           │
# └──────────────────────────────────────────────────────────────┘
resource "google_gke_hub_membership" "this" {

  membership_id    = ""     # string | required | The client-provided identifier of the membership.
  id               = ""     # string | optional+computed
  labels           = {}     # map(string) | optional | Labels to apply to this membership.   **Note**: This field i…
  location         = ""     # string | optional | Location of the membership. The default value is 'global'.
  project          = ""     # string | optional+computed

  # effective_labels = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # name             = ""     # string | computed | The unique identifier of the membership.
  # terraform_labels = {}     # map(string) | computed | The combination of labels configured directly on the resourc…

  authority { # list [0..1]
    issuer = ""     # string | required | A JSON Web Token (JWT) issuer URI. 'issuer' must start with …

  }

  endpoint { # list [0..1]

    gke_cluster { # list [0..1]
      resource_link = ""     # string | required | Self-link of the GCP resource for the GKE cluster. For examp…

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

