# ┌──────────────────────────────────────────────────────────────┐
# │  resource: google_logging_metric                               │
# └──────────────────────────────────────────────────────────────┘
resource "google_logging_metric" "this" {

  filter           = ""     # string | required | An advanced logs filter (https://cloud.google.com/logging/do…
  name             = ""     # string | required | The client-assigned metric identifier. Examples - "error_cou…
  bucket_name      = ""     # string | optional | The resource name of the Log Bucket that owns the Log Metric…
  description      = ""     # string | optional | A description of this metric, which is used in documentation…
  disabled         = false  # bool | optional | If set to True, then this metric is disabled and it does not…
  id               = ""     # string | optional+computed
  label_extractors = {}     # map(string) | optional | A map from a label key string to an extractor expression whi…
  project          = ""     # string | optional+computed
  value_extractor  = ""     # string | optional | A valueExtractor is required when using a distribution logs-…

  bucket_options { # list [0..1]

    explicit_buckets { # list [0..1]
      bounds = []     # list(number) | required | The values must be monotonically increasing.

    }

    exponential_buckets { # list [0..1]
      growth_factor      = 0      # number | required | Must be greater than 1.
      num_finite_buckets = 0      # number | required | Must be greater than 0.
      scale              = 0      # number | required | Must be greater than 0.

    }

    linear_buckets { # list [0..1]
      num_finite_buckets = 0      # number | required | Must be greater than 0.
      offset             = 0      # number | required | Lower bound of the first bucket.
      width              = 0      # number | required | Must be greater than 0.

    }

  }

  metric_descriptor { # list [0..1]
    metric_kind  = ""     # string | required | Whether the metric records instantaneous values, changes to …
    value_type   = ""     # string | required | Whether the measurement is an integer, a floating-point numb…
    display_name = ""     # string | optional | A concise name for the metric, which can be displayed in use…
    unit         = ""     # string | optional | The unit in which the metric value is reported. It is only a…

    labels { # set
      key         = ""     # string | required | The label key.
      description = ""     # string | optional | A human-readable description for the label.
      value_type  = ""     # string | optional | The type of data that can be assigned to the label. Default …

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

