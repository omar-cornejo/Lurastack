# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_compute_region_per_instance_config           │
# └──────────────────────────────────────────────────────────────┘
resource "google_compute_region_per_instance_config" "this" {

  name                             = ""     # string | required | The name for this per-instance config and its corresponding …
  region_instance_group_manager    = ""     # string | required | The region instance group manager this instance config is pa…
  id                               = ""     # string | optional+computed
  minimal_action                   = ""     # string | optional | The minimal action to perform on the instance during an upda…
  most_disruptive_allowed_action   = ""     # string | optional | The most disruptive action to perform on the instance during…
  project                          = ""     # string | optional+computed
  region                           = ""     # string | optional+computed | Region where the containing instance group manager is locate…
  remove_instance_on_destroy       = false  # bool | optional | When true, deleting this config will immediately remove the …
  remove_instance_state_on_destroy = false  # bool | optional | When true, deleting this config will immediately remove any …

  preserved_state { # list [0..1]
    metadata = {}     # map(string) | optional | Preserved metadata defined for this instance. This is a list…

    disk { # set
      device_name = ""     # string | required | A unique device name that is reflected into the /dev/ tree o…
      source      = ""     # string | required | The URI of an existing persistent disk to attach under the s…
      delete_rule = ""     # string | optional | A value that prescribes what should happen to the stateful d…
      mode        = ""     # string | optional | The mode of the disk. Default value: "READ_WRITE" Possible v…

    }

    external_ip { # set
      interface_name = ""     # string | required
      auto_delete    = ""     # string | optional | These stateful IPs will never be released during autohealing…

      ip_address { # list [0..1]
        address = ""     # string | optional | The URL of the reservation for this IP address.

      }

    }

    internal_ip { # set
      interface_name = ""     # string | required
      auto_delete    = ""     # string | optional | These stateful IPs will never be released during autohealing…

      ip_address { # list [0..1]
        address = ""     # string | optional | The URL of the reservation for this IP address.

      }

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

