# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_dataproc_autoscaling_policy                  │
# └──────────────────────────────────────────────────────────────┘
resource "google_dataproc_autoscaling_policy" "this" {

  policy_id = ""     # string | required | The policy id. The id must contain only letters (a-z, A-Z), …
  id        = ""     # string | optional+computed
  location  = ""     # string | optional | The  location where the autoscaling policy should reside. Th…
  project   = ""     # string | optional+computed

  # name      = ""     # string | computed | The "resource name" of the autoscaling policy.

  basic_algorithm { # list [0..1]
    cooldown_period = ""     # string | optional | Duration between scaling events. A scaling period starts aft…

    yarn_config { # list [1..1]
      graceful_decommission_timeout  = ""     # string | required | Timeout for YARN graceful decommissioning of Node Managers. …
      scale_down_factor              = 0      # number | required | Fraction of average pending memory in the last cooldown peri…
      scale_up_factor                = 0      # number | required | Fraction of average pending memory in the last cooldown peri…
      scale_down_min_worker_fraction = 0      # number | optional | Minimum scale-down threshold as a fraction of total cluster …
      scale_up_min_worker_fraction   = 0      # number | optional | Minimum scale-up threshold as a fraction of total cluster si…

    }

  }

  secondary_worker_config { # list [0..1]
    max_instances = 0      # number | optional | Maximum number of instances for this group. Note that by def…
    min_instances = 0      # number | optional | Minimum number of instances for this group. Bounds: [0, maxI…
    weight        = 0      # number | optional | Weight for the instance group, which is used to determine th…

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

  worker_config { # list [0..1]
    max_instances = 0      # number | required | Maximum number of instances for this group.
    min_instances = 0      # number | optional | Minimum number of instances for this group. Bounds: [2, maxI…
    weight        = 0      # number | optional | Weight for the instance group, which is used to determine th…

  }

}

