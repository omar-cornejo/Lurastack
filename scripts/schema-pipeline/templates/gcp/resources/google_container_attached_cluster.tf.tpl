# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_container_attached_cluster                   │
# └──────────────────────────────────────────────────────────────┘
resource "google_container_attached_cluster" "this" {

  distribution             = ""     # string | required | The Kubernetes distribution of the underlying attached clust…
  location                 = ""     # string | required | The location for the resource
  name                     = ""     # string | required | The name of this resource.
  platform_version         = ""     # string | required | The platform version for the cluster (e.g. '1.23.0-gke.1').
  annotations              = {}     # map(string) | optional | Optional. Annotations on the cluster. This field has the sam…
  deletion_policy          = ""     # string | optional | Policy to determine what flags to send on delete.
  description              = ""     # string | optional | A human readable description of this attached cluster. Canno…
  id                       = ""     # string | optional+computed
  project                  = ""     # string | optional+computed

  # cluster_region           = ""     # string | computed | Output only. The region where this cluster runs.  For EKS cl…
  # create_time              = ""     # string | computed | Output only. The time at which this cluster was created.
  # effective_annotations    = {}     # map(string) | computed | All of annotations (key/value pairs) present on the resource…
  # errors = [  # list(object)
  #   {
  #     message = ""
  #   }
  # ]
  # kubernetes_version       = ""     # string | computed | The Kubernetes version of the cluster.
  # reconciling              = false  # bool | computed | If set, there are currently changes in flight to the cluster…
  # state                    = ""     # string | computed | The current state of the cluster. Possible values: STATE_UNS…
  # uid                      = ""     # string | computed | A globally unique identifier for the cluster.
  # update_time              = ""     # string | computed | The time at which this cluster was last updated.
  # workload_identity_config = [  # list(object)
  #   {
  #     identity_provider = ""
  #     issuer_uri = ""
  #     workload_pool = ""
  #   }
  # ]

  authorization { # list [0..1]
    admin_groups = []     # list(string) | optional | Groups that can perform operations as a cluster admin. A man…
    admin_users  = []     # list(string) | optional | Users that can perform operations as a cluster admin. A mana…

  }

  binary_authorization { # list [0..1]
    evaluation_mode = ""     # string | optional | Configure Binary Authorization evaluation mode. Possible val…

  }

  fleet { # list [1..1]
    project    = ""     # string | required | The number of the Fleet host project where this cluster will…

    # membership = ""     # string | computed | The name of the managed Hub Membership resource associated t…

  }

  logging_config { # list [0..1]

    component_config { # list [0..1]
      enable_components = []     # list(string) | optional | The components to be enabled. Possible values: ["SYSTEM_COMP…

    }

  }

  monitoring_config { # list [0..1]

    managed_prometheus_config { # list [0..1]
      enabled = false  # bool | optional | Enable Managed Collection.

    }

  }

  oidc_config { # list [1..1]
    issuer_url = ""     # string | required | A JSON Web Token (JWT) issuer URI. 'issuer' must start with …
    jwks       = ""     # string | optional | OIDC verification keys in JWKS format (RFC 7517).

  }

  proxy_config { # list [0..1]

    kubernetes_secret { # list [0..1]
      name      = ""     # string | required | Name of the kubernetes secret containing the proxy config.
      namespace = ""     # string | required | Namespace of the kubernetes secret containing the proxy conf…

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

