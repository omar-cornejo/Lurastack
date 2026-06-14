# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_bigtable_app_profile                         │
# └──────────────────────────────────────────────────────────────┘
resource "google_bigtable_app_profile" "this" {

  app_profile_id                    = ""     # string | required | The unique name of the app profile in the form '[_a-zA-Z0-9]…
  description                       = ""     # string | optional | Long form description of the use case for this app profile.
  id                                = ""     # string | optional+computed
  ignore_warnings                   = false  # bool | optional | If true, ignore safety checks when deleting/updating the app…
  instance                          = ""     # string | optional | The name of the instance to create the app profile within.
  multi_cluster_routing_cluster_ids = []     # list(string) | optional | The set of clusters to route to. The order is ignored; clust…
  multi_cluster_routing_use_any     = false  # bool | optional | If true, read/write requests are routed to the nearest clust…
  project                           = ""     # string | optional+computed

  # name                              = ""     # string | computed | The unique name of the requested app profile. Values are of …

  data_boost_isolation_read_only { # list [0..1]
    compute_billing_owner = ""     # string | required | The Compute Billing Owner for this Data Boost App Profile. P…

  }

  single_cluster_routing { # list [0..1]
    cluster_id                 = ""     # string | required | The cluster to which read/write requests should be routed.
    allow_transactional_writes = false  # bool | optional | If true, CheckAndMutateRow and ReadModifyWriteRow requests a…

  }

  standard_isolation { # list [0..1]
    priority = ""     # string | required | The priority of requests sent using this app profile. Possib…

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

