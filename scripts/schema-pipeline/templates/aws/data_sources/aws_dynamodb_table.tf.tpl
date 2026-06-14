# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_dynamodb_table                                      │
# └──────────────────────────────────────────────────────────────┘
data "aws_dynamodb_table" "this" {

  name                        = ""     # string | required
  id                          = ""     # string | optional+computed
  tags                        = {}     # map(string) | optional+computed

  # arn                         = ""     # string | computed
  # attribute = [  # set(object)
  #   {
  #     name = ""
  #     type = ""
  #   }
  # ]
  # billing_mode                = ""     # string | computed
  # deletion_protection_enabled = false  # bool | computed
  # global_secondary_index = [  # set(object)
  #   {
  #     hash_key = ""
  #     name = ""
  #     non_key_attributes = []  # list(string)
  #     on_demand_throughput = [  # list(object)
  #       {
  #         max_read_request_units = 0
  #         max_write_request_units = 0
  #       }
  #     ]
  #     projection_type = ""
  #     range_key = ""
  #     read_capacity = 0
  #     write_capacity = 0
  #   }
  # ]
  # hash_key                    = ""     # string | computed
  # local_secondary_index = [  # set(object)
  #   {
  #     name = ""
  #     non_key_attributes = []  # list(string)
  #     projection_type = ""
  #     range_key = ""
  #   }
  # ]
  # on_demand_throughput = [  # list(object)
  #   {
  #     max_read_request_units = 0
  #     max_write_request_units = 0
  #   }
  # ]
  # point_in_time_recovery = [  # list(object)
  #   {
  #     enabled = false
  #     recovery_period_in_days = 0
  #   }
  # ]
  # range_key                   = ""     # string | computed
  # read_capacity               = 0      # number | computed
  # replica = [  # set(object)
  #   {
  #     kms_key_arn = ""
  #     region_name = ""
  #   }
  # ]
  # stream_arn                  = ""     # string | computed
  # stream_enabled              = false  # bool | computed
  # stream_label                = ""     # string | computed
  # stream_view_type            = ""     # string | computed
  # table_class                 = ""     # string | computed
  # ttl = [  # set(object)
  #   {
  #     attribute_name = ""
  #     enabled = false
  #   }
  # ]
  # write_capacity              = 0      # number | computed

  server_side_encryption { # list [0..1]

    # enabled     = false  # bool | computed
    # kms_key_arn = ""     # string | computed

  }

}

