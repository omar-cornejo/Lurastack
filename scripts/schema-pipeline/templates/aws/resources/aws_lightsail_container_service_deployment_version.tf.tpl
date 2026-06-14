# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_lightsail_container_service_deployment_version  │
# └──────────────────────────────────────────────────────────────┘
resource "aws_lightsail_container_service_deployment_version" "this" {

  service_name = ""     # string | required
  id           = ""     # string | optional+computed

  # created_at   = ""     # string | computed
  # state        = ""     # string | computed
  # version      = 0      # number | computed

  container { # set [1..53]
    container_name = ""     # string | required
    image          = ""     # string | required
    command        = []     # list(string) | optional
    environment    = {}     # map(string) | optional
    ports          = {}     # map(string) | optional

  }

  public_endpoint { # list [0..1]
    container_name = ""     # string | required
    container_port = 0      # number | required

    health_check { # list [1..1]
      healthy_threshold   = 0      # number | optional
      interval_seconds    = 0      # number | optional
      path                = ""     # string | optional
      success_codes       = ""     # string | optional
      timeout_seconds     = 0      # number | optional
      unhealthy_threshold = 0      # number | optional

    }

  }

  timeouts { # single
    create = ""     # string | optional

  }

}

