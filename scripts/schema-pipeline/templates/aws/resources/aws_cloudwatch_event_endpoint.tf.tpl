# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_cloudwatch_event_endpoint                       │
# └──────────────────────────────────────────────────────────────┘
resource "aws_cloudwatch_event_endpoint" "this" {

  name         = ""     # string | required
  description  = ""     # string | optional
  id           = ""     # string | optional+computed
  role_arn     = ""     # string | optional

  # arn          = ""     # string | computed
  # endpoint_url = ""     # string | computed

  event_bus { # list [2..2]
    event_bus_arn = ""     # string | required

  }

  replication_config { # list [0..1]
    state = ""     # string | optional

  }

  routing_config { # list [1..1]

    failover_config { # list [1..1]

      primary { # list [1..1]
        health_check = ""     # string | optional

      }

      secondary { # list [1..1]
        route = ""     # string | optional

      }

    }

  }

}

