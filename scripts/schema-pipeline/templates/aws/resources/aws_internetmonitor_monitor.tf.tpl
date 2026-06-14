# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_internetmonitor_monitor                         │
# └──────────────────────────────────────────────────────────────┘
resource "aws_internetmonitor_monitor" "this" {

  monitor_name                  = ""     # string | required
  id                            = ""     # string | optional+computed
  max_city_networks_to_monitor  = 0      # number | optional
  resources                     = []     # set(string) | optional
  status                        = ""     # string | optional
  tags                          = {}     # map(string) | optional
  tags_all                      = {}     # map(string) | optional+computed
  traffic_percentage_to_monitor = 0      # number | optional

  # arn                           = ""     # string | computed

  health_events_config { # list [0..1]
    availability_score_threshold = 0      # number | optional
    performance_score_threshold  = 0      # number | optional

  }

  internet_measurements_log_delivery { # list [0..1]

    s3_config { # list [0..1]
      bucket_name         = ""     # string | required
      bucket_prefix       = ""     # string | optional
      log_delivery_status = ""     # string | optional

    }

  }

}

