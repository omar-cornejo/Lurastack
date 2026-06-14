# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_route53_traffic_policy_document                     │
# └──────────────────────────────────────────────────────────────┘
data "aws_route53_traffic_policy_document" "this" {

  id             = ""     # string | optional+computed
  record_type    = ""     # string | optional
  start_endpoint = ""     # string | optional
  start_rule     = ""     # string | optional
  version        = ""     # string | optional

  # json           = ""     # string | computed

  endpoint { # set
    id     = ""     # string | required
    region = ""     # string | optional
    type   = ""     # string | optional
    value  = ""     # string | optional

  }

  rule { # set
    id   = ""     # string | required
    type = ""     # string | optional

    geo_proximity_location { # set
      bias                   = ""     # string | optional
      endpoint_reference     = ""     # string | optional
      evaluate_target_health = false  # bool | optional
      health_check           = ""     # string | optional
      latitude               = ""     # string | optional
      longitude              = ""     # string | optional
      region                 = ""     # string | optional
      rule_reference         = ""     # string | optional

    }

    items { # set
      endpoint_reference = ""     # string | optional
      health_check       = ""     # string | optional

    }

    location { # set
      continent              = ""     # string | optional
      country                = ""     # string | optional
      endpoint_reference     = ""     # string | optional
      evaluate_target_health = false  # bool | optional
      health_check           = ""     # string | optional
      is_default             = false  # bool | optional
      rule_reference         = ""     # string | optional
      subdivision            = ""     # string | optional

    }

    primary { # list [0..1]
      endpoint_reference     = ""     # string | optional
      evaluate_target_health = false  # bool | optional
      health_check           = ""     # string | optional
      rule_reference         = ""     # string | optional

    }

    region { # set
      endpoint_reference     = ""     # string | optional
      evaluate_target_health = false  # bool | optional
      health_check           = ""     # string | optional
      region                 = ""     # string | optional
      rule_reference         = ""     # string | optional

    }

    secondary { # list [0..1]
      endpoint_reference     = ""     # string | optional
      evaluate_target_health = false  # bool | optional
      health_check           = ""     # string | optional
      rule_reference         = ""     # string | optional

    }

  }

}

