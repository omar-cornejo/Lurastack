# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_appmesh_gateway_route                               │
# └──────────────────────────────────────────────────────────────┘
data "aws_appmesh_gateway_route" "this" {

  mesh_name            = ""     # string | required
  name                 = ""     # string | required
  virtual_gateway_name = ""     # string | required
  id                   = ""     # string | optional+computed
  mesh_owner           = ""     # string | optional+computed
  tags                 = {}     # map(string) | optional+computed

  # arn                  = ""     # string | computed
  # created_date         = ""     # string | computed
  # last_updated_date    = ""     # string | computed
  # resource_owner       = ""     # string | computed
  # spec = [  # list(object)
  #   {
  #     grpc_route = [  # list(object)
  #       {
  #         action = [  # list(object)
  #           {
  #             target = [  # list(object)
  #               {
  #                 port = 0
  #                 virtual_service = [  # list(object)
  #                   {
  #                     virtual_service_name = ""
  #                   }
  #                 ]
  #               }
  #             ]
  #           }
  #         ]
  #         match = [  # list(object)
  #           {
  #             port = 0
  #             service_name = ""
  #           }
  #         ]
  #       }
  #     ]
  #     http2_route = [  # list(object)
  #       {
  #         action = [  # list(object)
  #           {
  #             rewrite = [  # list(object)
  #               {
  #                 hostname = [  # list(object)
  #                   {
  #                     default_target_hostname = ""
  #                   }
  #                 ]
  #                 path = [  # list(object)
  #                   {
  #                     exact = ""
  #                   }
  #                 ]
  #                 prefix = [  # list(object)
  #                   {
  #                     default_prefix = ""
  #                     value = ""
  #                   }
  #                 ]
  #               }
  #             ]
  #             target = [  # list(object)
  #               {
  #                 port = 0
  #                 virtual_service = [  # list(object)
  #                   {
  #                     virtual_service_name = ""
  #                   }
  #                 ]
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
  #             hostname = [  # list(object)
  #               {
  #                 exact = ""
  #                 suffix = ""
  #               }
  #             ]
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
  #           }
  #         ]
  #       }
  #     ]
  #     http_route = [  # list(object)
  #       {
  #         action = [  # list(object)
  #           {
  #             rewrite = [  # list(object)
  #               {
  #                 hostname = [  # list(object)
  #                   {
  #                     default_target_hostname = ""
  #                   }
  #                 ]
  #                 path = [  # list(object)
  #                   {
  #                     exact = ""
  #                   }
  #                 ]
  #                 prefix = [  # list(object)
  #                   {
  #                     default_prefix = ""
  #                     value = ""
  #                   }
  #                 ]
  #               }
  #             ]
  #             target = [  # list(object)
  #               {
  #                 port = 0
  #                 virtual_service = [  # list(object)
  #                   {
  #                     virtual_service_name = ""
  #                   }
  #                 ]
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
  #             hostname = [  # list(object)
  #               {
  #                 exact = ""
  #                 suffix = ""
  #               }
  #             ]
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
  #           }
  #         ]
  #       }
  #     ]
  #     priority = 0
  #   }
  # ]

}

