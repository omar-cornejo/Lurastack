# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_compute_resource_policy                      │
# └──────────────────────────────────────────────────────────────┘
resource "google_compute_resource_policy" "this" {

  name        = ""     # string | required | The name of the resource, provided by the client when initia…
  description = ""     # string | optional | An optional description of this resource. Provide this prope…
  id          = ""     # string | optional+computed
  project     = ""     # string | optional+computed
  region      = ""     # string | optional+computed | Region where resource policy resides.

  # self_link   = ""     # string | computed

  disk_consistency_group_policy { # list [0..1]
    enabled = false  # bool | required | Enable disk consistency on the resource policy.

  }

  group_placement_policy { # list [0..1]
    availability_domain_count = 0      # number | optional | The number of availability domains instances will be spread …
    collocation               = ""     # string | optional | Collocation specifies whether to place VMs inside the same a…
    vm_count                  = 0      # number | optional | Number of VMs in this placement group. Google does not recom…

  }

  instance_schedule_policy { # list [0..1]
    time_zone       = ""     # string | required | Specifies the time zone to be used in interpreting the sched…
    expiration_time = ""     # string | optional | The expiration time of the schedule. The timestamp is an RFC…
    start_time      = ""     # string | optional | The start time of the schedule. The timestamp is an RFC3339 …

    vm_start_schedule { # list [0..1]
      schedule = ""     # string | required | Specifies the frequency for the operation, using the unix-cr…

    }

    vm_stop_schedule { # list [0..1]
      schedule = ""     # string | required | Specifies the frequency for the operation, using the unix-cr…

    }

  }

  snapshot_schedule_policy { # list [0..1]

    retention_policy { # list [0..1]
      max_retention_days    = 0      # number | required | Maximum age of the snapshot that is allowed to be kept.
      on_source_disk_delete = ""     # string | optional | Specifies the behavior to apply to scheduled snapshots when …

    }

    schedule { # list [1..1]

      daily_schedule { # list [0..1]
        days_in_cycle = 0      # number | required | Defines a schedule with units measured in days. The value de…
        start_time    = ""     # string | required | This must be in UTC format that resolves to one of 00:00, 04…

      }

      hourly_schedule { # list [0..1]
        hours_in_cycle = 0      # number | required | The number of hours between snapshots.
        start_time     = ""     # string | required | Time within the window to start the operations. It must be i…

      }

      weekly_schedule { # list [0..1]

        day_of_weeks { # set [1..7]
          day        = ""     # string | required | The day of the week to create the snapshot. e.g. MONDAY Poss…
          start_time = ""     # string | required | Time within the window to start the operations. It must be i…

        }

      }

    }

    snapshot_properties { # list [0..1]
      chain_name        = ""     # string | optional | Creates the new snapshot in the snapshot chain labeled with …
      guest_flush       = false  # bool | optional | Whether to perform a 'guest aware' snapshot.
      labels            = {}     # map(string) | optional | A set of key-value pairs.
      storage_locations = []     # set(string) | optional | Cloud Storage bucket location to store the auto snapshot (re…

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

