# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_service_networking_peered_dns_domain         │
# └──────────────────────────────────────────────────────────────┘
resource "google_service_networking_peered_dns_domain" "this" {

  dns_suffix = ""     # string | required | The DNS domain name suffix of the peered DNS domain.
  name       = ""     # string | required | Name of the peered DNS domain.
  network    = ""     # string | required | Network in the consumer project to peer with.
  id         = ""     # string | optional+computed
  project    = ""     # string | optional+computed | The ID of the project that the service account will be creat…
  service    = ""     # string | optional | The name of the service to create a peered DNS domain for, e…

  # parent     = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    read   = ""     # string | optional

  }

}

