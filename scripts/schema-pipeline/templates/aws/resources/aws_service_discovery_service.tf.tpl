# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_service_discovery_service                       │
# └──────────────────────────────────────────────────────────────┘
resource "aws_service_discovery_service" "this" {

  name          = ""     # string | required
  description   = ""     # string | optional
  force_destroy = false  # bool | optional
  id            = ""     # string | optional+computed
  namespace_id  = ""     # string | optional+computed
  tags          = {}     # map(string) | optional
  tags_all      = {}     # map(string) | optional+computed
  type          = ""     # string | optional+computed

  # arn           = ""     # string | computed

  dns_config { # list [0..1]
    namespace_id   = ""     # string | required
    routing_policy = ""     # string | optional

    dns_records { # list [1..*]
      ttl  = 0      # number | required
      type = ""     # string | required

    }

  }

  health_check_config { # list [0..1]
    failure_threshold = 0      # number | optional
    resource_path     = ""     # string | optional
    type              = ""     # string | optional

  }

  health_check_custom_config { # list [0..1]
    failure_threshold = 0      # number | optional

  }

}

