# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_compute_autoscaler                           │
# └──────────────────────────────────────────────────────────────┘
resource "google_compute_autoscaler" "this" {

  name               = ""     # string | required | Name of the resource. The name must be 1-63 characters long …
  target             = ""     # string | required | URL of the managed instance group that this autoscaler will …
  description        = ""     # string | optional | An optional description of this resource.
  id                 = ""     # string | optional+computed
  project            = ""     # string | optional+computed
  zone               = ""     # string | optional+computed | URL of the zone where the instance group resides.

  # creation_timestamp = ""     # string | computed | Creation timestamp in RFC3339 text format.
  # self_link          = ""     # string | computed

  autoscaling_policy { # list [1..1]
    max_replicas    = 0      # number | required | The maximum number of instances that the autoscaler can scal…
    min_replicas    = 0      # number | required | The minimum number of replicas that the autoscaler can scale…
    cooldown_period = 0      # number | optional | The number of seconds that the autoscaler should wait before…
    mode            = ""     # string | optional | Defines operating mode for this policy.

    cpu_utilization { # list [0..1]
      target            = 0      # number | required | The target CPU utilization that the autoscaler should mainta…
      predictive_method = ""     # string | optional | Indicates whether predictive autoscaling based on CPU metric…

    }

    load_balancing_utilization { # list [0..1]
      target = 0      # number | required | Fraction of backend capacity utilization (set in HTTP(s) loa…

    }

    metric { # list
      name   = ""     # string | required | The identifier (type) of the Stackdriver Monitoring metric. …
      target = 0      # number | optional | The target value of the metric that autoscaler should mainta…
      type   = ""     # string | optional | Defines how target utilization value is expressed for a Stac…

    }

    scale_in_control { # list [0..1]
      time_window_sec = 0      # number | optional | How long back autoscaling should look when computing recomme…

      max_scaled_in_replicas { # list [0..1]
        fixed   = 0      # number | optional | Specifies a fixed number of VM instances. This must be a pos…
        percent = 0      # number | optional | Specifies a percentage of instances between 0 to 100%, inclu…

      }

    }

    scaling_schedules { # set
      duration_sec          = 0      # number | required | The duration of time intervals (in seconds) for which this s…
      min_required_replicas = 0      # number | required | Minimum number of VM instances that autoscaler will recommen…
      name                  = ""     # string | required
      schedule              = ""     # string | required | The start timestamps of time intervals when this scaling sch…
      description           = ""     # string | optional | A description of a scaling schedule.
      disabled              = false  # bool | optional | A boolean value that specifies if a scaling schedule can inf…
      time_zone             = ""     # string | optional | The time zone to be used when interpreting the schedule. The…

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

