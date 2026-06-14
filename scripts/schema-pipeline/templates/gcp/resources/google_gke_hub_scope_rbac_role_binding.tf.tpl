# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_gke_hub_scope_rbac_role_binding              │
# └──────────────────────────────────────────────────────────────┘
resource "google_gke_hub_scope_rbac_role_binding" "this" {

  scope_id                   = ""     # string | required | Id of the scope
  scope_rbac_role_binding_id = ""     # string | required | The client-provided identifier of the RBAC Role Binding.
  group                      = ""     # string | optional | Principal that is be authorized in the cluster (at least of …
  id                         = ""     # string | optional+computed
  labels                     = {}     # map(string) | optional | Labels for this ScopeRBACRoleBinding.   **Note**: This field…
  project                    = ""     # string | optional+computed
  user                       = ""     # string | optional | Principal that is be authorized in the cluster (at least of …

  # create_time                = ""     # string | computed | Time the RBAC Role Binding was created in UTC.
  # delete_time                = ""     # string | computed | Time the RBAC Role Binding was deleted in UTC.
  # effective_labels           = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # name                       = ""     # string | computed | The resource name for the RBAC Role Binding
  # state = [  # list(object)
  #   {
  #     code = ""
  #   }
  # ]
  # terraform_labels           = {}     # map(string) | computed | The combination of labels configured directly on the resourc…
  # uid                        = ""     # string | computed | Google-generated UUID for this resource.
  # update_time                = ""     # string | computed | Time the RBAC Role Binding was updated in UTC.

  role { # list [1..1]
    predefined_role = ""     # string | optional | PredefinedRole is an ENUM representation of the default Kube…

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

