# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_vertex_ai_feature_online_store               │
# └──────────────────────────────────────────────────────────────┘
resource "google_vertex_ai_feature_online_store" "this" {

  name             = ""     # string | required | The resource name of the Feature Online Store. This value ma…
  force_destroy    = false  # bool | optional | If set to true, any FeatureViews and Features for this Featu…
  id               = ""     # string | optional+computed
  labels           = {}     # map(string) | optional | The labels with user-defined metadata to organize your featu…
  project          = ""     # string | optional+computed
  region           = ""     # string | optional+computed | The region of feature online store. eg us-central1

  # create_time      = ""     # string | computed | The timestamp of when the feature online store was created i…
  # effective_labels = {}     # map(string) | computed | All of labels (key/value pairs) present on the resource in G…
  # etag             = ""     # string | computed | Used to perform consistent read-modify-write updates.
  # state            = ""     # string | computed | The state of the Feature Online Store. See the possible stat…
  # terraform_labels = {}     # map(string) | computed | The combination of labels configured directly on the resourc…
  # update_time      = ""     # string | computed | The timestamp of when the feature online store was last upda…

  bigtable { # list [0..1]

    auto_scaling { # list [1..1]
      max_node_count         = 0      # number | required | The maximum number of nodes to scale up to. Must be greater …
      min_node_count         = 0      # number | required | The minimum number of nodes to scale down to. Must be greate…
      cpu_utilization_target = 0      # number | optional+computed | A percentage of the cluster's CPU capacity. Can be from 10% …

    }

  }

  dedicated_serving_endpoint { # list [0..1]

    # public_endpoint_domain_name = ""     # string | computed | Domain name to use for this FeatureOnlineStore
    # service_attachment          = ""     # string | computed | Name of the service attachment resource. Applicable only if …

    private_service_connect_config { # list [0..1]
      enable_private_service_connect = false  # bool | required | If set to true, customers will use private service connectio…
      project_allowlist              = []     # list(string) | optional | A list of Projects from which the forwarding rule will targe…

    }

  }

  optimized {} # list [0..1]

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

