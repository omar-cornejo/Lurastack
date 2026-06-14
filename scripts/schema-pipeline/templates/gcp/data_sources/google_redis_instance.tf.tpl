# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_redis_instance                                   │
# └──────────────────────────────────────────────────────────────┘
data "google_redis_instance" "this" {

  name                     = ""     # string | required | The ID of the instance or a fully qualified identifier for t…
  id                       = ""     # string | optional+computed
  project                  = ""     # string | optional
  region                   = ""     # string | optional | The name of the Redis region of the instance.

  # alternative_location_id  = ""     # string | computed | Only applicable to STANDARD_HA tier which protects the insta…
  # auth_enabled             = false  # bool | computed | Optional. Indicates whether OSS Redis AUTH is enabled for th…
  # auth_string              = ""     # string | computed | AUTH String set on the instance. This field will only be pop…
  # authorized_network       = ""     # string | computed | The full name of the Google Compute Engine network to which …
  # connect_mode             = ""     # string | computed | The connection mode of the Redis instance. Default value: "D…
  # create_time              = ""     # string | computed | The time the instance was created in RFC3339 UTC "Zulu" form…
  # current_location_id      = ""     # string | computed | The current zone where the Redis endpoint is placed. For Bas…
  # customer_managed_key     = ""     # string | computed | Optional. The KMS key reference that you want to use to encr…
  # display_name             = ""     # string | computed | An arbitrary and optional user-provided name for the instanc…
  # effective_labels         = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # host                     = ""     # string | computed | Hostname or IP address of the exposed Redis endpoint used by…
  # labels                   = {}     # map(string) | computed | Resource labels to represent user provided metadata.  **Note…
  # location_id              = ""     # string | computed | The zone where the instance will be provisioned. If not prov…
  # maintenance_policy = [  # list(object)
  #   {
  #     create_time = ""
  #     description = ""
  #     update_time = ""
  #     weekly_maintenance_window = [  # list(object)
  #       {
  #         day = ""
  #         duration = ""
  #         start_time = [  # list(object)
  #           {
  #             hours = 0
  #             minutes = 0
  #             nanos = 0
  #             seconds = 0
  #           }
  #         ]
  #       }
  #     ]
  #   }
  # ]
  # maintenance_schedule = [  # list(object)
  #   {
  #     end_time = ""
  #     schedule_deadline_time = ""
  #     start_time = ""
  #   }
  # ]
  # maintenance_version      = ""     # string | computed | The self service update maintenance version.
  # memory_size_gb           = 0      # number | computed | Redis memory size in GiB.
  # nodes = [  # list(object)
  #   {
  #     id = ""
  #     zone = ""
  #   }
  # ]
  # persistence_config = [  # list(object)
  #   {
  #     persistence_mode = ""
  #     rdb_next_snapshot_time = ""
  #     rdb_snapshot_period = ""
  #     rdb_snapshot_start_time = ""
  #   }
  # ]
  # persistence_iam_identity = ""     # string | computed | Output only. Cloud IAM identity used by import / export oper…
  # port                     = 0      # number | computed | The port number of the exposed Redis endpoint.
  # read_endpoint            = ""     # string | computed | Output only. Hostname or IP address of the exposed readonly …
  # read_endpoint_port       = 0      # number | computed | Output only. The port number of the exposed readonly redis e…
  # read_replicas_mode       = ""     # string | computed | Optional. Read replica mode. Can only be specified when tryi…
  # redis_configs            = {}     # map(string) | computed | Redis configuration parameters, according to http://redis.io…
  # redis_version            = ""     # string | computed | The version of Redis software. If not provided, latest suppo…
  # replica_count            = 0      # number | computed | Optional. The number of replica nodes. The valid range for t…
  # reserved_ip_range        = ""     # string | computed | The CIDR range of internal addresses that are reserved for t…
  # secondary_ip_range       = ""     # string | computed | Optional. Additional IP range for node placement. Required w…
  # server_ca_certs = [  # list(object)
  #   {
  #     cert = ""
  #     create_time = ""
  #     expire_time = ""
  #     serial_number = ""
  #     sha1_fingerprint = ""
  #   }
  # ]
  # terraform_labels         = {}     # map(string) | computed | The combination of labels configured directly on the resourc…
  # tier                     = ""     # string | computed | The service tier of the instance. Must be one of these value…
  # transit_encryption_mode  = ""     # string | computed | The TLS mode of the Redis instance, If not provided, TLS is …

}

