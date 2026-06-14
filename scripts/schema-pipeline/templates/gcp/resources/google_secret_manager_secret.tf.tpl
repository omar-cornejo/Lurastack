# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_secret_manager_secret                        │
# └──────────────────────────────────────────────────────────────┘
resource "google_secret_manager_secret" "this" {

  secret_id             = ""     # string | required | This must be unique within the project.
  annotations           = {}     # map(string) | optional | Custom metadata about the secret.  Annotations are distinct …
  expire_time           = ""     # string | optional+computed | Timestamp in UTC when the Secret is scheduled to expire. Thi…
  id                    = ""     # string | optional+computed
  labels                = {}     # map(string) | optional | The labels assigned to this Secret.  Label keys must be betw…
  project               = ""     # string | optional+computed
  ttl                   = ""     # string | optional | The TTL for the Secret. A duration in seconds with up to nin…
  version_aliases       = {}     # map(string) | optional | Mapping from version alias to version name.  A version alias…
  version_destroy_ttl   = ""     # string | optional | Secret Version TTL after destruction request. This is a part…

  # create_time           = ""     # string | computed | The time at which the Secret was created.
  # effective_annotations = {}     # map(string) | computed | All of annotations (key/value pairs) present on the resource…
  # effective_labels      = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # name                  = ""     # string | computed | The resource name of the Secret. Format: 'projects/{{project…
  # terraform_labels      = {}     # map(string) | computed | The combination of labels configured directly on the resourc…

  replication { # list [1..1]

    auto { # list [0..1]

      customer_managed_encryption { # list [0..1]
        kms_key_name = ""     # string | required | The resource name of the Cloud KMS CryptoKey used to encrypt…

      }

    }

    user_managed { # list [0..1]

      replicas { # list [1..*]
        location = ""     # string | required | The canonical IDs of the location to replicate data. For exa…

        customer_managed_encryption { # list [0..1]
          kms_key_name = ""     # string | required | Describes the Cloud KMS encryption key that will be used to …

        }

      }

    }

  }

  rotation { # list [0..1]
    next_rotation_time = ""     # string | optional | Timestamp in UTC at which the Secret is scheduled to rotate.…
    rotation_period    = ""     # string | optional | The Duration between rotation notifications. Must be in seco…

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

  topics { # list
    name = ""     # string | required | The resource name of the Pub/Sub topic that will be publishe…

  }

}

