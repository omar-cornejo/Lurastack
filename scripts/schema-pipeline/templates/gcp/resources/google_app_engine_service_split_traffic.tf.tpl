# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_app_engine_service_split_traffic             │
# └──────────────────────────────────────────────────────────────┘
resource "google_app_engine_service_split_traffic" "this" {

  service         = ""     # string | required | The name of the service these settings apply to.
  id              = ""     # string | optional+computed
  migrate_traffic = false  # bool | optional | If set to true traffic will be migrated to this version.
  project         = ""     # string | optional+computed

  split { # list [1..1]
    allocations = {}     # map(string) | required | Mapping from version IDs within the service to fractional (0…
    shard_by    = ""     # string | optional | Mechanism used to determine which version a request is sent …

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

