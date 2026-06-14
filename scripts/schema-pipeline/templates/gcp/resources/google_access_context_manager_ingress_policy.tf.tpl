# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_access_context_manager_ingress_policy        │
# └──────────────────────────────────────────────────────────────┘
resource "google_access_context_manager_ingress_policy" "this" {

  ingress_policy_name = ""     # string | required | The name of the Service Perimeter to add this resource to.
  resource            = ""     # string | required | A GCP resource that is inside of the service perimeter.
  id                  = ""     # string | optional+computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

