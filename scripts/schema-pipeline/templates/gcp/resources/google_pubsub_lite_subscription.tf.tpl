# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_pubsub_lite_subscription                     │
# └──────────────────────────────────────────────────────────────┘
resource "google_pubsub_lite_subscription" "this" {

  name    = ""     # string | required | Name of the subscription.
  topic   = ""     # string | required | A reference to a Topic resource.
  id      = ""     # string | optional+computed
  project = ""     # string | optional+computed
  region  = ""     # string | optional | The region of the pubsub lite topic.
  zone    = ""     # string | optional | The zone of the pubsub lite topic.

  delivery_config { # list [0..1]
    delivery_requirement = ""     # string | required | When this subscription should send messages to subscribers r…

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

