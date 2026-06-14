# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_compute_shared_vpc_host_project              │
# └──────────────────────────────────────────────────────────────┘
resource "google_compute_shared_vpc_host_project" "this" {

  project = ""     # string | required | The ID of the project that will serve as a Shared VPC host p…
  id      = ""     # string | optional+computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

