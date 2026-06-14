# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_route53_records_exclusive                       │
# └──────────────────────────────────────────────────────────────┘
resource "aws_route53_records_exclusive" "this" {

  zone_id = ""     # string | required

  resource_record_set { # set
    name                       = ""     # string | required
    failover                   = ""     # string | optional
    health_check_id            = ""     # string | optional
    multi_value_answer         = false  # bool | optional
    region                     = ""     # string | optional
    set_identifier             = ""     # string | optional
    traffic_policy_instance_id = ""     # string | optional
    ttl                        = 0      # number | optional
    type                       = ""     # string | optional
    weight                     = 0      # number | optional

    alias_target { # list
      dns_name               = ""     # string | required
      evaluate_target_health = false  # bool | required
      hosted_zone_id         = ""     # string | required

    }

    cidr_routing_config { # list
      collection_id = ""     # string | required
      location_name = ""     # string | required

    }

    geolocation { # list
      continent_code   = ""     # string | optional
      country_code     = ""     # string | optional
      subdivision_code = ""     # string | optional

    }

    geoproximity_location { # list
      aws_region       = ""     # string | optional
      bias             = 0      # number | optional
      local_zone_group = ""     # string | optional

      coordinates { # list
        latitude  = ""     # string | required
        longitude = ""     # string | required

      }

    }

    resource_records { # list
      value = ""     # string | required

    }

  }

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    update = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}

