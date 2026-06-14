# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_compute_shared_vpc_service_project           │
# └──────────────────────────────────────────────────────────────┘
resource "google_compute_shared_vpc_service_project" "this" {

  host_project    = ""     # string | required | The ID of a host project to associate.
  service_project = ""     # string | required | The ID of the project that will serve as a Shared VPC servic…
  deletion_policy = ""     # string | optional | The deletion policy for the shared VPC service. Setting ABAN…
  id              = ""     # string | optional+computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

