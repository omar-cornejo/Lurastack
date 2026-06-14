# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_cloudbuild_worker_pool                       │
# └──────────────────────────────────────────────────────────────┘
resource "google_cloudbuild_worker_pool" "this" {

  location              = ""     # string | required | The location for the resource
  name                  = ""     # string | required | User-defined name of the `WorkerPool`.
  annotations           = {}     # map(string) | optional | User specified annotations. See https://google.aip.dev/128#a…
  display_name          = ""     # string | optional | A user-specified, human-readable name for the `WorkerPool`. …
  id                    = ""     # string | optional+computed
  project               = ""     # string | optional+computed | The project for the resource

  # create_time           = ""     # string | computed | Output only. Time at which the request to create the `Worker…
  # delete_time           = ""     # string | computed | Output only. Time at which the request to delete the `Worker…
  # effective_annotations = {}     # map(string) | computed | All of annotations (key/value pairs) present on the resource…
  # state                 = ""     # string | computed | Output only. `WorkerPool` state. Possible values: STATE_UNSP…
  # uid                   = ""     # string | computed | Output only. A unique identifier for the `WorkerPool`.
  # update_time           = ""     # string | computed | Output only. Time at which the request to update the `Worker…

  network_config { # list [0..1]
    peered_network          = ""     # string | required | Required. Immutable. The network definition that the workers…
    peered_network_ip_range = ""     # string | optional | Optional. Immutable. Subnet IP range within the peered netwo…

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

  worker_config { # list [0..1]
    disk_size_gb   = 0      # number | optional | Size of the disk attached to the worker, in GB. See [Worker …
    machine_type   = ""     # string | optional | Machine type of a worker, such as `n1-standard-1`. See [Work…
    no_external_ip = false  # bool | optional+computed | If true, workers are created without any public address, whi…

  }

}

