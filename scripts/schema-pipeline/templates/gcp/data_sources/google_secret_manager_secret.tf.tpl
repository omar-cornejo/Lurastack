# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_secret_manager_secret                            │
# └──────────────────────────────────────────────────────────────┘
data "google_secret_manager_secret" "this" {

  secret_id             = ""     # string | required | This must be unique within the project.
  id                    = ""     # string | optional+computed
  project               = ""     # string | optional

  # annotations           = {}     # map(string) | computed | Custom metadata about the secret.  Annotations are distinct …
  # create_time           = ""     # string | computed | The time at which the Secret was created.
  # effective_annotations = {}     # map(string) | computed | All of annotations (key/value pairs) present on the resource…
  # effective_labels      = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # expire_time           = ""     # string | computed | Timestamp in UTC when the Secret is scheduled to expire. Thi…
  # labels                = {}     # map(string) | computed | The labels assigned to this Secret.  Label keys must be betw…
  # name                  = ""     # string | computed | The resource name of the Secret. Format: 'projects/{{project…
  # replication = [  # list(object)
  #   {
  #     auto = [  # list(object)
  #       {
  #         customer_managed_encryption = [  # list(object)
  #           {
  #             kms_key_name = ""
  #           }
  #         ]
  #       }
  #     ]
  #     user_managed = [  # list(object)
  #       {
  #         replicas = [  # list(object)
  #           {
  #             customer_managed_encryption = [  # list(object)
  #               {
  #                 kms_key_name = ""
  #               }
  #             ]
  #             location = ""
  #           }
  #         ]
  #       }
  #     ]
  #   }
  # ]
  # rotation = [  # list(object)
  #   {
  #     next_rotation_time = ""
  #     rotation_period = ""
  #   }
  # ]
  # terraform_labels      = {}     # map(string) | computed | The combination of labels configured directly on the resourc…
  # topics = [  # list(object)
  #   {
  #     name = ""
  #   }
  # ]
  # ttl                   = ""     # string | computed | The TTL for the Secret. A duration in seconds with up to nin…
  # version_aliases       = {}     # map(string) | computed | Mapping from version alias to version name.  A version alias…
  # version_destroy_ttl   = ""     # string | computed | Secret Version TTL after destruction request. This is a part…

}

