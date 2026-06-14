# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_pubsub_lite_topic                            │
# └──────────────────────────────────────────────────────────────┘
resource "google_pubsub_lite_topic" "this" {

  name    = ""     # string | required | Name of the topic.
  id      = ""     # string | optional+computed
  project = ""     # string | optional+computed
  region  = ""     # string | optional | The region of the pubsub lite topic.
  zone    = ""     # string | optional | The zone of the pubsub lite topic.

  partition_config { # list [0..1]
    count = 0      # number | required | The number of partitions in the topic. Must be at least 1.

    capacity { # list [0..1]
      publish_mib_per_sec   = 0      # number | required | Subscribe throughput capacity per partition in MiB/s. Must b…
      subscribe_mib_per_sec = 0      # number | required | Publish throughput capacity per partition in MiB/s. Must be …

    }

  }

  reservation_config { # list [0..1]
    throughput_reservation = ""     # string | optional | The Reservation to use for this topic's throughput capacity.

  }

  retention_config { # list [0..1]
    per_partition_bytes = ""     # string | required | The provisioned storage, in bytes, per partition. If the num…
    period              = ""     # string | optional | How long a published message is retained. If unset, messages…

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

