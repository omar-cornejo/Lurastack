# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_redshiftserverless_workgroup                    │
# └──────────────────────────────────────────────────────────────┘
resource "aws_redshiftserverless_workgroup" "this" {

  namespace_name       = ""     # string | required
  workgroup_name       = ""     # string | required
  base_capacity        = 0      # number | optional+computed
  enhanced_vpc_routing = false  # bool | optional
  id                   = ""     # string | optional+computed
  max_capacity         = 0      # number | optional
  port                 = 0      # number | optional+computed
  publicly_accessible  = false  # bool | optional
  security_group_ids   = []     # set(string) | optional+computed
  subnet_ids           = []     # set(string) | optional+computed
  tags                 = {}     # map(string) | optional
  tags_all             = {}     # map(string) | optional+computed
  track_name           = ""     # string | optional+computed

  # arn                  = ""     # string | computed
  # endpoint = [  # list(object)
  #   {
  #     address = ""
  #     port = 0
  #     vpc_endpoint = [  # list(object)
  #       {
  #         network_interface = [  # list(object)
  #           {
  #             availability_zone = ""
  #             network_interface_id = ""
  #             private_ip_address = ""
  #             subnet_id = ""
  #           }
  #         ]
  #         vpc_endpoint_id = ""
  #         vpc_id = ""
  #       }
  #     ]
  #   }
  # ]
  # workgroup_id         = ""     # string | computed

  config_parameter { # set
    parameter_key   = ""     # string | required
    parameter_value = ""     # string | required

  }

  price_performance_target { # list [0..1]
    enabled = false  # bool | required
    level   = 0      # number | optional

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

