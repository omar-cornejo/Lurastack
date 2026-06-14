# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_memcache_instance                            │
# └──────────────────────────────────────────────────────────────┘
resource "google_memcache_instance" "this" {

  name                  = ""     # string | required | The resource name of the instance.
  node_count            = 0      # number | required | Number of nodes in the memcache instance.
  authorized_network    = ""     # string | optional+computed | The full name of the GCE network to connect the instance to.…
  display_name          = ""     # string | optional+computed | A user-visible name for the instance.
  id                    = ""     # string | optional+computed
  labels                = {}     # map(string) | optional | Resource labels to represent user-provided metadata.   **Not…
  memcache_version      = ""     # string | optional | The major version of Memcached software. If not provided, la…
  project               = ""     # string | optional+computed
  region                = ""     # string | optional+computed | The region of the Memcache instance. If it is not provided, …
  reserved_ip_range_id  = []     # list(string) | optional | Contains the name of allocated IP address ranges associated …
  zones                 = []     # set(string) | optional+computed | Zones where memcache nodes should be provisioned.  If not pr…

  # create_time           = ""     # string | computed | Creation timestamp in RFC3339 text format.
  # discovery_endpoint    = ""     # string | computed | Endpoint for Discovery API
  # effective_labels      = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # maintenance_schedule = [  # list(object)
  #   {
  #     end_time = ""
  #     schedule_deadline_time = ""
  #     start_time = ""
  #   }
  # ]
  # memcache_full_version = ""     # string | computed | The full version of memcached server running on this instanc…
  # memcache_nodes = [  # list(object)
  #   {
  #     host = ""
  #     node_id = ""
  #     port = 0
  #     state = ""
  #     zone = ""
  #   }
  # ]
  # terraform_labels      = {}     # map(string) | computed | The combination of labels configured directly on the resourc…

  maintenance_policy { # list [0..1]
    description = ""     # string | optional | Optional. Description of what this policy is for. Create/Upd…

    # create_time = ""     # string | computed | Output only. The time when the policy was created. A timesta…
    # update_time = ""     # string | computed | Output only. The time when the policy was updated. A timesta…

    weekly_maintenance_window { # list [1..*]
      day      = ""     # string | required | Required. The day of week that maintenance updates occur. - …
      duration = ""     # string | required | Required. The length of the maintenance window, ranging from…

      start_time { # list [1..1]
        hours   = 0      # number | optional | Hours of day in 24 hour format. Should be from 0 to 23. An A…
        minutes = 0      # number | optional | Minutes of hour of day. Must be from 0 to 59.
        nanos   = 0      # number | optional | Fractions of seconds in nanoseconds. Must be from 0 to 999,9…
        seconds = 0      # number | optional | Seconds of minutes of the time. Must normally be from 0 to 5…

      }

    }

  }

  memcache_parameters { # list [0..1]
    params = {}     # map(string) | optional | User-defined set of parameters to use in the memcache proces…

    # id     = ""     # string | computed | This is a unique ID associated with this set of parameters.

  }

  node_config { # list [1..1]
    cpu_count      = 0      # number | required | Number of CPUs per node.
    memory_size_mb = 0      # number | required | Memory size in Mebibytes for each memcache node.

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

