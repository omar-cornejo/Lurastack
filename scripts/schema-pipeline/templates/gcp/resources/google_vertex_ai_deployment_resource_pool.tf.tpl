# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_vertex_ai_deployment_resource_pool           │
# └──────────────────────────────────────────────────────────────┘
resource "google_vertex_ai_deployment_resource_pool" "this" {

  name        = ""     # string | required | The resource name of deployment resource pool. The maximum l…
  id          = ""     # string | optional+computed
  project     = ""     # string | optional+computed
  region      = ""     # string | optional | The region of deployment resource pool. eg us-central1

  # create_time = ""     # string | computed | A timestamp in RFC3339 UTC "Zulu" format, with nanosecond re…

  dedicated_resources { # list [0..1]
    min_replica_count = 0      # number | required | The minimum number of machine replicas this DeployedModel wi…
    max_replica_count = 0      # number | optional | The maximum number of replicas this DeployedModel may be dep…

    autoscaling_metric_specs { # list
      metric_name = ""     # string | required | The resource metric name. Supported metrics: For Online Pred…
      target      = 0      # number | optional | The target resource utilization in percentage (1% - 100%) fo…

    }

    machine_spec { # list [1..1]
      accelerator_count = 0      # number | optional | The number of accelerators to attach to the machine.
      accelerator_type  = ""     # string | optional | The type of accelerator(s) that may be attached to the machi…
      machine_type      = ""     # string | optional | The type of the machine. See the [list of machine types supp…

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

