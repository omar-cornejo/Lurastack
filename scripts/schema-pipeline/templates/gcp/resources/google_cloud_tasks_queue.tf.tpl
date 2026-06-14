# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_cloud_tasks_queue                            │
# └──────────────────────────────────────────────────────────────┘
resource "google_cloud_tasks_queue" "this" {

  location = ""     # string | required | The location of the queue
  id       = ""     # string | optional+computed
  name     = ""     # string | optional | The queue name.
  project  = ""     # string | optional+computed

  app_engine_routing_override { # list [0..1]
    instance = ""     # string | optional | App instance.  By default, the task is sent to an instance w…
    service  = ""     # string | optional | App service.  By default, the task is sent to the service wh…
    version  = ""     # string | optional | App version.  By default, the task is sent to the version wh…

    # host     = ""     # string | computed | The host that the task is sent to.

  }

  rate_limits { # list [0..1]
    max_concurrent_dispatches = 0      # number | optional+computed | The maximum number of concurrent tasks that Cloud Tasks allo…
    max_dispatches_per_second = 0      # number | optional+computed | The maximum rate at which tasks are dispatched from this que…

    # max_burst_size            = 0      # number | computed | The max burst size.  Max burst size limits how fast tasks in…

  }

  retry_config { # list [0..1]
    max_attempts       = 0      # number | optional+computed | Number of attempts per task.  Cloud Tasks will attempt the t…
    max_backoff        = ""     # string | optional+computed | A task will be scheduled for retry between minBackoff and ma…
    max_doublings      = 0      # number | optional+computed | The time between retries will double maxDoublings times.  A …
    max_retry_duration = ""     # string | optional+computed | If positive, maxRetryDuration specifies the time limit for r…
    min_backoff        = ""     # string | optional+computed | A task will be scheduled for retry between minBackoff and ma…

  }

  stackdriver_logging_config { # list [0..1]
    sampling_ratio = 0      # number | required | Specifies the fraction of operations to write to Stackdriver…

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

