# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_route53_record                                  │
# └──────────────────────────────────────────────────────────────┘
resource "aws_route53_record" "this" {

  name                             = ""     # string | required
  type                             = ""     # string | required
  zone_id                          = ""     # string | required
  allow_overwrite                  = false  # bool | optional+computed
  health_check_id                  = ""     # string | optional
  id                               = ""     # string | optional+computed
  multivalue_answer_routing_policy = false  # bool | optional
  records                          = []     # set(string) | optional
  set_identifier                   = ""     # string | optional
  ttl                              = 0      # number | optional

  # fqdn                             = ""     # string | computed

  alias { # list [0..1]
    evaluate_target_health = false  # bool | required
    name                   = ""     # string | required
    zone_id                = ""     # string | required

  }

  cidr_routing_policy { # list [0..1]
    collection_id = ""     # string | required
    location_name = ""     # string | required

  }

  failover_routing_policy { # list [0..1]
    type = ""     # string | required

  }

  geolocation_routing_policy { # list [0..1]
    continent   = ""     # string | optional
    country     = ""     # string | optional
    subdivision = ""     # string | optional

  }

  geoproximity_routing_policy { # list [0..1]
    aws_region       = ""     # string | optional
    bias             = 0      # number | optional
    local_zone_group = ""     # string | optional

    coordinates { # set
      latitude  = ""     # string | required
      longitude = ""     # string | required

    }

  }

  latency_routing_policy { # list [0..1]
    region = ""     # string | required

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

  weighted_routing_policy { # list [0..1]
    weight = 0      # number | required

  }

}

