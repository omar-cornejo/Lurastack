# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_gke_hub_scope                                │
# └──────────────────────────────────────────────────────────────┘
resource "google_gke_hub_scope" "this" {

  scope_id         = ""     # string | required | The client-provided identifier of the scope.
  id               = ""     # string | optional+computed
  labels           = {}     # map(string) | optional | Labels for this Scope.   **Note**: This field is non-authori…
  namespace_labels = {}     # map(string) | optional | Scope-level cluster namespace labels. For the member cluster…
  project          = ""     # string | optional+computed

  # create_time      = ""     # string | computed | Time the Scope was created in UTC.
  # delete_time      = ""     # string | computed | Time the Scope was deleted in UTC.
  # effective_labels = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # name             = ""     # string | computed | The unique identifier of the scope
  # state = [  # list(object)
  #   {
  #     code = ""
  #   }
  # ]
  # terraform_labels = {}     # map(string) | computed | The combination of labels configured directly on the resourc…
  # uid              = ""     # string | computed | Google-generated UUID for this resource.
  # update_time      = ""     # string | computed | Time the Scope was updated in UTC.

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

