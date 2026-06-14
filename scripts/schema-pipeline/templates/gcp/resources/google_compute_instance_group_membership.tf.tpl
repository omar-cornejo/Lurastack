# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_compute_instance_group_membership            │
# └──────────────────────────────────────────────────────────────┘
resource "google_compute_instance_group_membership" "this" {

  instance       = ""     # string | required | An instance being added to the InstanceGroup
  instance_group = ""     # string | required | Represents an Instance Group resource name that the instance…
  id             = ""     # string | optional+computed
  project        = ""     # string | optional+computed
  zone           = ""     # string | optional | A reference to the zone where the instance group resides.

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

