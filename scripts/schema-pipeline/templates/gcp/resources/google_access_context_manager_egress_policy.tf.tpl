# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_access_context_manager_egress_policy         │
# └──────────────────────────────────────────────────────────────┘
resource "google_access_context_manager_egress_policy" "this" {

  egress_policy_name = ""     # string | required | The name of the Service Perimeter to add this resource to.
  resource           = ""     # string | required | A GCP resource that is inside of the service perimeter.
  id                 = ""     # string | optional+computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

