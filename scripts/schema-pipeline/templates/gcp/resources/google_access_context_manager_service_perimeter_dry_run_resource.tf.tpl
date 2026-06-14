# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_access_context_manager_service_perimeter_dry_run_resource  │
# └──────────────────────────────────────────────────────────────┘
resource "google_access_context_manager_service_perimeter_dry_run_resource" "this" {

  perimeter_name = ""     # string | required | The name of the Service Perimeter to add this resource to.
  resource       = ""     # string | required | A GCP resource that is inside of the service perimeter. Curr…
  id             = ""     # string | optional+computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

