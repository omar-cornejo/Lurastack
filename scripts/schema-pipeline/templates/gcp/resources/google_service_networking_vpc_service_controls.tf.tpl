# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_service_networking_vpc_service_controls      │
# └──────────────────────────────────────────────────────────────┘
resource "google_service_networking_vpc_service_controls" "this" {

  enabled = false  # bool | required | Desired VPC Service Controls state service producer VPC netw…
  network = ""     # string | required | The network that the consumer is using to connect with servi…
  service = ""     # string | required | The service that is managing peering connectivity for a serv…
  id      = ""     # string | optional+computed
  project = ""     # string | optional | The id of the Google Cloud project containing the consumer n…

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

