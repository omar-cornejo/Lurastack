# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_gke_hub_namespace                            │
# └──────────────────────────────────────────────────────────────┘
resource "google_gke_hub_namespace" "this" {

  scope              = ""     # string | required | The name of the Scope instance.
  scope_id           = ""     # string | required | Id of the scope
  scope_namespace_id = ""     # string | required | The client-provided identifier of the namespace.
  id                 = ""     # string | optional+computed
  labels             = {}     # map(string) | optional | Labels for this Namespace.   **Note**: This field is non-aut…
  namespace_labels   = {}     # map(string) | optional | Namespace-level cluster namespace labels. These labels are a…
  project            = ""     # string | optional+computed

  # create_time        = ""     # string | computed | Time the Namespace was created in UTC.
  # delete_time        = ""     # string | computed | Time the Namespace was deleted in UTC.
  # effective_labels   = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # name               = ""     # string | computed | The resource name for the namespace
  # state = [  # list(object)
  #   {
  #     code = ""
  #   }
  # ]
  # terraform_labels   = {}     # map(string) | computed | The combination of labels configured directly on the resourc…
  # uid                = ""     # string | computed | Google-generated UUID for this resource.
  # update_time        = ""     # string | computed | Time the Namespace was updated in UTC.

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

