# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_monitoring_metric_descriptor                 │
# └──────────────────────────────────────────────────────────────┘
resource "google_monitoring_metric_descriptor" "this" {

  description              = ""     # string | required | A detailed description of the metric, which can be used in d…
  display_name             = ""     # string | required | A concise name for the metric, which can be displayed in use…
  metric_kind              = ""     # string | required | Whether the metric records instantaneous values, changes to …
  type                     = ""     # string | required | The metric type, including its DNS name prefix. The type is …
  value_type               = ""     # string | required | Whether the measurement is an integer, a floating-point numb…
  id                       = ""     # string | optional+computed
  launch_stage             = ""     # string | optional | The launch stage of the metric definition. Possible values: …
  project                  = ""     # string | optional+computed
  unit                     = ""     # string | optional | The units in which the metric value is reported. It is only …

  # monitored_resource_types = []     # set(string) | computed | If present, then a time series, which is identified partiall…
  # name                     = ""     # string | computed | The resource name of the metric descriptor.

  labels { # set
    key         = ""     # string | required | The key for this label. The key must not exceed 100 characte…
    description = ""     # string | optional | A human-readable description for the label.
    value_type  = ""     # string | optional | The type of data that can be assigned to the label. Default …

  }

  metadata { # list [0..1]
    ingest_delay  = ""     # string | optional | The delay of data points caused by ingestion. Data points ol…
    sample_period = ""     # string | optional | The sampling period of metric data points. For metrics which…

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

