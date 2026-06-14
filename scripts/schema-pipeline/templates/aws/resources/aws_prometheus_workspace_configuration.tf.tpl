# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_prometheus_workspace_configuration              │
# └──────────────────────────────────────────────────────────────┘
resource "aws_prometheus_workspace_configuration" "this" {

  workspace_id             = ""     # string | required
  retention_period_in_days = 0      # number | optional+computed

  limits_per_label_set { # list
    label_set = {}     # map(string) | required

    limits { # list
      max_series = 0      # number | required

    }

  }

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    update = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}

