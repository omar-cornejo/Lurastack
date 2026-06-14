# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_appmesh_route                                       │
# └──────────────────────────────────────────────────────────────┘
data "aws_appmesh_route" "this" {

  mesh_name           = ""     # string | required
  name                = ""     # string | required
  virtual_router_name = ""     # string | required
  id                  = ""     # string | optional+computed
  mesh_owner          = ""     # string | optional+computed
  tags                = {}     # map(string) | optional+computed

  # arn                 = ""     # string | computed
  # created_date        = ""     # string | computed
  # last_updated_date   = ""     # string | computed
  # resource_owner      = ""     # string | computed
  # spec = [  # list(object)
  #   {
  #     grpc_route = [  # list(object)
  #       {
  #         action = [  # list(object)
  #           {
  #             weighted_target = [  # set(object)
  #               {
  #                 port = 0
  #                 virtual_node = ""
  #                 weight = 0
  #               }
  #             ]
  #           }
  #         ]
  #         match = [  # list(object)
  #           {
  #             metadata = [  # set(object)
  #               {
  #                 invert = false
  #                 match = [  # list(object)
  #                   {
  #                     exact = ""
  #                     prefix = ""
  #                     range = [  # list(object)
  #                       {
  #                         end = 0
  #                         start = 0
  #                       }
  #                     ]
  #                     regex = ""
  #                     suffix = ""
  #                   }
  #                 ]
  #                 name = ""
  #               }
  #             ]
  #             method_name = ""
  #             port = 0
  #             prefix = ""
  #             service_name = ""
  #           }
  #         ]
  #         retry_policy = [  # list(object)
  #           {
  #             grpc_retry_events = []  # set(string)
  #             http_retry_events = []  # set(string)
  #             max_retries = 0
  #             per_retry_timeout = [  # list(object)
  #               {
  #                 unit = ""
  #                 value = 0
  #               }
  #             ]
  #             tcp_retry_events = []  # set(string)
  #           }
  #         ]
  #         timeout = [  # list(object)
  #           {
  #             idle = [  # list(object)
  #               {
  #                 unit = ""
  #                 value = 0
  #               }
  #             ]
  #             per_request = [  # list(object)
  #               {
  #                 unit = ""
  #                 value = 0
  #               }
  #             ]
  #           }
  #         ]
  #       }
  #     ]
  #     http2_route = [  # list(object)
  #       {
  #         action = [  # list(object)
  #           {
  #             weighted_target = [  # set(object)
  #               {
  #                 port = 0
  #                 virtual_node = ""
  #                 weight = 0
  #               }
  #             ]
  #           }
  #         ]
  #         match = [  # list(object)
  #           {
  #             header = [  # set(object)
  #               {
  #                 invert = false
  #                 match = [  # list(object)
  #                   {
  #                     exact = ""
  #                     prefix = ""
  #                     range = [  # list(object)
  #                       {
  #                         end = 0
  #                         start = 0
  #                       }
  #                     ]
  #                     regex = ""
  #                     suffix = ""
  #                   }
  #                 ]
  #                 name = ""
  #               }
  #             ]
  #             method = ""
  #             path = [  # list(object)
  #               {
  #                 exact = ""
  #                 regex = ""
  #               }
  #             ]
  #             port = 0
  #             prefix = ""
  #             query_parameter = [  # set(object)
  #               {
  #                 match = [  # list(object)
  #                   {
  #                     exact = ""
  #                   }
  #                 ]
  #                 name = ""
  #               }
  #             ]
  #             scheme = ""
  #           }
  #         ]
  #         retry_policy = [  # list(object)
  #           {
  #             http_retry_events = []  # set(string)
  #             max_retries = 0
  #             per_retry_timeout = [  # list(object)
  #               {
  #                 unit = ""
  #                 value = 0
  #               }
  #             ]
  #             tcp_retry_events = []  # set(string)
  #           }
  #         ]
  #         timeout = [  # list(object)
  #           {
  #             idle = [  # list(object)
  #               {
  #                 unit = ""
  #                 value = 0
  #               }
  #             ]
  #             per_request = [  # list(object)
  #               {
  #                 unit = ""
  #                 value = 0
  #               }
  #             ]
  #           }
  #         ]
  #       }
  #     ]
  #     http_route = [  # list(object)
  #       {
  #         action = [  # list(object)
  #           {
  #             weighted_target = [  # set(object)
  #               {
  #                 port = 0
  #                 virtual_node = ""
  #                 weight = 0
  #               }
  #             ]
  #           }
  #         ]
  #         match = [  # list(object)
  #           {
  #             header = [  # set(object)
  #               {
  #                 invert = false
  #                 match = [  # list(object)
  #                   {
  #                     exact = ""
  #                     prefix = ""
  #                     range = [  # list(object)
  #                       {
  #                         end = 0
  #                         start = 0
  #                       }
  #                     ]
  #                     regex = ""
  #                     suffix = ""
  #                   }
  #                 ]
  #                 name = ""
  #               }
  #             ]
  #             method = ""
  #             path = [  # list(object)
  #               {
  #                 exact = ""
  #                 regex = ""
  #               }
  #             ]
  #             port = 0
  #             prefix = ""
  #             query_parameter = [  # set(object)
  #               {
  #                 match = [  # list(object)
  #                   {
  #                     exact = ""
  #                   }
  #                 ]
  #                 name = ""
  #               }
  #             ]
  #             scheme = ""
  #           }
  #         ]
  #         retry_policy = [  # list(object)
  #           {
  #             http_retry_events = []  # set(string)
  #             max_retries = 0
  #             per_retry_timeout = [  # list(object)
  #               {
  #                 unit = ""
  #                 value = 0
  #               }
  #             ]
  #             tcp_retry_events = []  # set(string)
  #           }
  #         ]
  #         timeout = [  # list(object)
  #           {
  #             idle = [  # list(object)
  #               {
  #                 unit = ""
  #                 value = 0
  #               }
  #             ]
  #             per_request = [  # list(object)
  #               {
  #                 unit = ""
  #                 value = 0
  #               }
  #             ]
  #           }
  #         ]
  #       }
  #     ]
  #     priority = 0
  #     tcp_route = [  # list(object)
  #       {
  #         action = [  # list(object)
  #           {
  #             weighted_target = [  # set(object)
  #               {
  #                 port = 0
  #                 virtual_node = ""
  #                 weight = 0
  #               }
  #             ]
  #           }
  #         ]
  #         match = [  # list(object)
  #           {
  #             port = 0
  #           }
  #         ]
  #         timeout = [  # list(object)
  #           {
  #             idle = [  # list(object)
  #               {
  #                 unit = ""
  #                 value = 0
  #               }
  #             ]
  #           }
  #         ]
  #       }
  #     ]
  #   }
  # ]

}

