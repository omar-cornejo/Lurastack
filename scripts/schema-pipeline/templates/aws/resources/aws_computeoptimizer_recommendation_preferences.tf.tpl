# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_computeoptimizer_recommendation_preferences     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_computeoptimizer_recommendation_preferences" "this" {

  resource_type                   = ""     # string | required
  enhanced_infrastructure_metrics = ""     # string | optional
  inferred_workload_types         = ""     # string | optional
  look_back_period                = ""     # string | optional+computed
  savings_estimation_mode         = ""     # string | optional

  # id                              = ""     # string | computed

  external_metrics_preference { # list
    source = ""     # string | required

  }

  preferred_resource { # list
    name         = ""     # string | required
    exclude_list = []     # set(string) | optional
    include_list = []     # set(string) | optional

  }

  scope { # list
    name  = ""     # string | required
    value = ""     # string | required

  }

  utilization_preference { # list
    metric_name = ""     # string | required

    metric_parameters { # list
      headroom  = ""     # string | required
      threshold = ""     # string | optional

    }

  }

}

