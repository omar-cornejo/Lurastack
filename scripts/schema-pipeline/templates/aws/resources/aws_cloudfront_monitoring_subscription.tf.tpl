# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_cloudfront_monitoring_subscription              │
# └──────────────────────────────────────────────────────────────┘
resource "aws_cloudfront_monitoring_subscription" "this" {

  distribution_id = ""     # string | required
  id              = ""     # string | optional+computed

  monitoring_subscription { # list [1..1]

    realtime_metrics_subscription_config { # list [1..1]
      realtime_metrics_subscription_status = ""     # string | required

    }

  }

}

