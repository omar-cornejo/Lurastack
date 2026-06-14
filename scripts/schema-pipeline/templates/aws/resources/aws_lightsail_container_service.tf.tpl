# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_lightsail_container_service                     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_lightsail_container_service" "this" {

  name                = ""     # string | required
  power               = ""     # string | required
  scale               = 0      # number | required
  id                  = ""     # string | optional+computed
  is_disabled         = false  # bool | optional
  tags                = {}     # map(string) | optional
  tags_all            = {}     # map(string) | optional+computed

  # arn                 = ""     # string | computed
  # availability_zone   = ""     # string | computed
  # created_at          = ""     # string | computed
  # power_id            = ""     # string | computed
  # principal_arn       = ""     # string | computed
  # private_domain_name = ""     # string | computed
  # resource_type       = ""     # string | computed
  # state               = ""     # string | computed
  # url                 = ""     # string | computed

  private_registry_access { # list [0..1]

    ecr_image_puller_role { # list [0..1]
      is_active     = false  # bool | optional

      # principal_arn = ""     # string | computed

    }

  }

  public_domain_names { # list [0..1]

    certificate { # set [1..*]
      certificate_name = ""     # string | required
      domain_names     = []     # list(string) | required

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

