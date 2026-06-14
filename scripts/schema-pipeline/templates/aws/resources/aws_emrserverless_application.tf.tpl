# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_emrserverless_application                       │
# └──────────────────────────────────────────────────────────────┘
resource "aws_emrserverless_application" "this" {

  name          = ""     # string | required
  release_label = ""     # string | required
  type          = ""     # string | required
  architecture  = ""     # string | optional
  id            = ""     # string | optional+computed
  tags          = {}     # map(string) | optional
  tags_all      = {}     # map(string) | optional+computed

  # arn           = ""     # string | computed

  auto_start_configuration { # list [0..1]
    enabled = false  # bool | optional

  }

  auto_stop_configuration { # list [0..1]
    enabled              = false  # bool | optional
    idle_timeout_minutes = 0      # number | optional

  }

  image_configuration { # list [0..1]
    image_uri = ""     # string | required

  }

  initial_capacity { # set
    initial_capacity_type = ""     # string | required

    initial_capacity_config { # list [0..1]
      worker_count = 0      # number | required

      worker_configuration { # list [0..1]
        cpu    = ""     # string | required
        memory = ""     # string | required
        disk   = ""     # string | optional+computed

      }

    }

  }

  interactive_configuration { # list [0..1]
    livy_endpoint_enabled = false  # bool | optional+computed
    studio_enabled        = false  # bool | optional+computed

  }

  maximum_capacity { # list [0..1]
    cpu    = ""     # string | required
    memory = ""     # string | required
    disk   = ""     # string | optional+computed

  }

  network_configuration { # list [0..1]
    security_group_ids = []     # set(string) | optional
    subnet_ids         = []     # set(string) | optional

  }

}

