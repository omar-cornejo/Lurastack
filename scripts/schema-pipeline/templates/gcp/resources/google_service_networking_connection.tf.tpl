# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_service_networking_connection                │
# └──────────────────────────────────────────────────────────────┘
resource "google_service_networking_connection" "this" {

  network                 = ""     # string | required | Name of VPC network connected with service producers using V…
  reserved_peering_ranges = []     # list(string) | required | Named IP address range(s) of PEERING type reserved for this …
  service                 = ""     # string | required | Provider peering service that is managing peering connectivi…
  deletion_policy         = ""     # string | optional | When set to ABANDON, terraform will abandon management of th…
  id                      = ""     # string | optional+computed
  update_on_creation_fail = false  # bool | optional | When set to true, enforce an update of the reserved peering …

  # peering                 = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

