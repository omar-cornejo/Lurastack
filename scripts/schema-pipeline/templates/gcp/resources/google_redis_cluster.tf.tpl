# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_redis_cluster                                │
# └──────────────────────────────────────────────────────────────┘
resource "google_redis_cluster" "this" {

  shard_count             = 0      # number | required | Required. Number of shards for the Redis cluster.
  authorization_mode      = ""     # string | optional | Optional. The authorization mode of the Redis cluster. If no…
  id                      = ""     # string | optional+computed
  name                    = ""     # string | optional+computed | Unique name of the resource in this scope including project …
  node_type               = ""     # string | optional+computed | The nodeType for the Redis cluster. If not provided, REDIS_H…
  project                 = ""     # string | optional+computed
  redis_configs           = {}     # map(string) | optional | Configure Redis Cluster behavior using a subset of native Re…
  region                  = ""     # string | optional+computed | The name of the region of the Redis cluster.
  replica_count           = 0      # number | optional | Optional. The number of replica nodes per shard.
  transit_encryption_mode = ""     # string | optional | Optional. The in-transit encryption for the Redis cluster. I…

  # create_time             = ""     # string | computed | The timestamp associated with the cluster creation request. …
  # discovery_endpoints = [  # list(object)
  #   {
  #     address = ""
  #     port = 0
  #     psc_config = [  # list(object)
  #       {
  #         network = ""
  #       }
  #     ]
  #   }
  # ]
  # precise_size_gb         = 0      # number | computed | Output only. Redis memory precise size in GB for the entire …
  # psc_connections = [  # list(object)
  #   {
  #     address = ""
  #     forwarding_rule = ""
  #     network = ""
  #     project_id = ""
  #     psc_connection_id = ""
  #   }
  # ]
  # size_gb                 = 0      # number | computed | Output only. Redis memory size in GB for the entire cluster.
  # state                   = ""     # string | computed | The current state of this cluster. Can be CREATING, READY, U…
  # state_info = [  # list(object)
  #   {
  #     update_info = [  # list(object)
  #       {
  #         target_replica_count = 0
  #         target_shard_count = 0
  #       }
  #     ]
  #   }
  # ]
  # uid                     = ""     # string | computed | System assigned, unique identifier for the cluster.

  psc_configs { # list [1..*]
    network = ""     # string | required | Required. The consumer network where the network address of …

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

  zone_distribution_config { # list [0..1]
    mode = ""     # string | optional+computed | Immutable. The mode for zone distribution for Memorystore Re…
    zone = ""     # string | optional | Immutable. The zone for single zone Memorystore Redis cluste…

  }

}

