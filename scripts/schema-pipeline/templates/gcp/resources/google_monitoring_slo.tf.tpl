# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_monitoring_slo                               │
# └──────────────────────────────────────────────────────────────┘
resource "google_monitoring_slo" "this" {

  goal                = 0      # number | required | The fraction of service that must be good in order for this …
  service             = ""     # string | required | ID of the service to which this SLO belongs.
  calendar_period     = ""     # string | optional | A calendar period, semantically "since the start of the curr…
  display_name        = ""     # string | optional | Name used for UI elements listing this SLO.
  id                  = ""     # string | optional+computed
  project             = ""     # string | optional+computed
  rolling_period_days = 0      # number | optional | A rolling time period, semantically "in the past X days". Mu…
  slo_id              = ""     # string | optional+computed | The id to use for this ServiceLevelObjective. If omitted, an…
  user_labels         = {}     # map(string) | optional | This field is intended to be used for organizing and identif…

  # name                = ""     # string | computed | The full resource name for this service. The syntax is: proj…

  basic_sli { # list [0..1]
    location = []     # set(string) | optional | An optional set of locations to which this SLI is relevant. …
    method   = []     # set(string) | optional | An optional set of RPCs to which this SLI is relevant. Telem…
    version  = []     # set(string) | optional | The set of API versions to which this SLI is relevant. Telem…

    availability { # list [0..1]
      enabled = false  # bool | optional | Whether an availability SLI is enabled or not. Must be set t…

    }

    latency { # list [0..1]
      threshold = ""     # string | required | A duration string, e.g. 10s. Good service is defined to be t…

    }

  }

  request_based_sli { # list [0..1]

    distribution_cut { # list [0..1]
      distribution_filter = ""     # string | required | A TimeSeries [monitoring filter](https://cloud.google.com/mo…

      range { # list [1..1]
        max = 0      # number | optional | max value for the range (inclusive). If not given, will be s…
        min = 0      # number | optional | Min value for the range (inclusive). If not given, will be s…

      }

    }

    good_total_ratio { # list [0..1]
      bad_service_filter   = ""     # string | optional | A TimeSeries [monitoring filter](https://cloud.google.com/mo…
      good_service_filter  = ""     # string | optional | A TimeSeries [monitoring filter](https://cloud.google.com/mo…
      total_service_filter = ""     # string | optional | A TimeSeries [monitoring filter](https://cloud.google.com/mo…

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

  windows_based_sli { # list [0..1]
    good_bad_metric_filter = ""     # string | optional | A TimeSeries [monitoring filter](https://cloud.google.com/mo…
    window_period          = ""     # string | optional | Duration over which window quality is evaluated, given as a …

    good_total_ratio_threshold { # list [0..1]
      threshold = 0      # number | optional | If window performance >= threshold, the window is counted as…

      basic_sli_performance { # list [0..1]
        location = []     # set(string) | optional | An optional set of locations to which this SLI is relevant. …
        method   = []     # set(string) | optional | An optional set of RPCs to which this SLI is relevant. Telem…
        version  = []     # set(string) | optional | The set of API versions to which this SLI is relevant. Telem…

        availability { # list [0..1]
          enabled = false  # bool | optional | Whether an availability SLI is enabled or not. Must be set t…

        }

        latency { # list [0..1]
          threshold = ""     # string | required | A duration string, e.g. 10s. Good service is defined to be t…

        }

      }

      performance { # list [0..1]

        distribution_cut { # list [0..1]
          distribution_filter = ""     # string | required | A TimeSeries [monitoring filter](https://cloud.google.com/mo…

          range { # list [1..1]
            max = 0      # number | optional | max value for the range (inclusive). If not given, will be s…
            min = 0      # number | optional | Min value for the range (inclusive). If not given, will be s…

          }

        }

        good_total_ratio { # list [0..1]
          bad_service_filter   = ""     # string | optional | A TimeSeries [monitoring filter](https://cloud.google.com/mo…
          good_service_filter  = ""     # string | optional | A TimeSeries [monitoring filter](https://cloud.google.com/mo…
          total_service_filter = ""     # string | optional | A TimeSeries [monitoring filter](https://cloud.google.com/mo…

        }

      }

    }

    metric_mean_in_range { # list [0..1]
      time_series = ""     # string | required | A [monitoring filter](https://cloud.google.com/monitoring/ap…

      range { # list [1..1]
        max = 0      # number | optional | max value for the range (inclusive). If not given, will be s…
        min = 0      # number | optional | Min value for the range (inclusive). If not given, will be s…

      }

    }

    metric_sum_in_range { # list [0..1]
      time_series = ""     # string | required | A [monitoring filter](https://cloud.google.com/monitoring/ap…

      range { # list [1..1]
        max = 0      # number | optional | max value for the range (inclusive). If not given, will be s…
        min = 0      # number | optional | Min value for the range (inclusive). If not given, will be s…

      }

    }

  }

}

