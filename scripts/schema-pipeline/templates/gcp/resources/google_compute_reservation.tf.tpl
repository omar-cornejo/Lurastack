# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_compute_reservation                          │
# └──────────────────────────────────────────────────────────────┘
resource "google_compute_reservation" "this" {

  name                          = ""     # string | required | Name of the resource. Provided by the client when the resour…
  zone                          = ""     # string | required | The zone where the reservation is made.
  description                   = ""     # string | optional | An optional description of this resource.
  id                            = ""     # string | optional+computed
  project                       = ""     # string | optional+computed
  specific_reservation_required = false  # bool | optional | When set to true, only VMs that target this reservation by n…

  # commitment                    = ""     # string | computed | Full or partial URL to a parent commitment. This field displ…
  # creation_timestamp            = ""     # string | computed | Creation timestamp in RFC3339 text format.
  # self_link                     = ""     # string | computed
  # status                        = ""     # string | computed | The status of the reservation.

  share_settings { # list [0..1]
    share_type = ""     # string | optional+computed | Type of sharing for this shared-reservation Possible values:…

    project_map { # set
      id         = ""     # string | required
      project_id = ""     # string | optional | The project id/number, should be same as the key of this pro…

    }

  }

  specific_reservation { # list [1..1]
    count        = 0      # number | required | The number of resources that are allocated.

    # in_use_count = 0      # number | computed | How many instances are in use.

    instance_properties { # list [1..1]
      machine_type     = ""     # string | required | The name of the machine type to reserve.
      min_cpu_platform = ""     # string | optional+computed | The minimum CPU platform for the reservation. For example, '…

      guest_accelerators { # list
        accelerator_count = 0      # number | required | The number of the guest accelerator cards exposed to this in…
        accelerator_type  = ""     # string | required | The full or partial URL of the accelerator type to attach to…

      }

      local_ssds { # list
        disk_size_gb = 0      # number | required | The size of the disk in base-2 GB.
        interface    = ""     # string | optional | The disk interface to use for attaching this disk. Default v…

      }

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

