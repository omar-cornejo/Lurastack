# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_compute_instance_group_named_port            │
# └──────────────────────────────────────────────────────────────┘
resource "google_compute_instance_group_named_port" "this" {

  group   = ""     # string | required | The name of the instance group.
  name    = ""     # string | required | The name for this named port. The name must be 1-63 characte…
  port    = 0      # number | required | The port number, which can be a value between 1 and 65535.
  id      = ""     # string | optional+computed
  project = ""     # string | optional+computed
  zone    = ""     # string | optional+computed | The zone of the instance group.

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

