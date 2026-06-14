# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_emr_instance_fleet                              │
# └──────────────────────────────────────────────────────────────┘
resource "aws_emr_instance_fleet" "this" {

  cluster_id                     = ""     # string | required
  id                             = ""     # string | optional+computed
  name                           = ""     # string | optional
  target_on_demand_capacity      = 0      # number | optional
  target_spot_capacity           = 0      # number | optional

  # provisioned_on_demand_capacity = 0      # number | computed
  # provisioned_spot_capacity      = 0      # number | computed

  instance_type_configs { # set
    instance_type                              = ""     # string | required
    bid_price                                  = ""     # string | optional
    bid_price_as_percentage_of_on_demand_price = 0      # number | optional
    weighted_capacity                          = 0      # number | optional

    configurations { # set
      classification = ""     # string | optional
      properties     = {}     # map(string) | optional

    }

    ebs_config { # set
      size                 = 0      # number | required
      type                 = ""     # string | required
      iops                 = 0      # number | optional
      volumes_per_instance = 0      # number | optional

    }

  }

  launch_specifications { # list [0..1]

    on_demand_specification { # list
      allocation_strategy = ""     # string | required

    }

    spot_specification { # list
      allocation_strategy      = ""     # string | required
      timeout_action           = ""     # string | required
      timeout_duration_minutes = 0      # number | required
      block_duration_minutes   = 0      # number | optional

    }

  }

}

