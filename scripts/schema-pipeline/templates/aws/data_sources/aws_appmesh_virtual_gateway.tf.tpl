# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_appmesh_virtual_gateway                             │
# └──────────────────────────────────────────────────────────────┘
data "aws_appmesh_virtual_gateway" "this" {

  mesh_name         = ""     # string | required
  name              = ""     # string | required
  id                = ""     # string | optional+computed
  tags              = {}     # map(string) | optional+computed

  # arn               = ""     # string | computed
  # created_date      = ""     # string | computed
  # last_updated_date = ""     # string | computed
  # mesh_owner        = ""     # string | computed
  # resource_owner    = ""     # string | computed
  # spec = [  # list(object)
  #   {
  #     backend_defaults = [  # list(object)
  #       {
  #         client_policy = [  # list(object)
  #           {
  #             tls = [  # list(object)
  #               {
  #                 certificate = [  # list(object)
  #                   {
  #                     file = [  # list(object)
  #                       {
  #                         certificate_chain = ""
  #                         private_key = ""
  #                       }
  #                     ]
  #                     sds = [  # list(object)
  #                       {
  #                         secret_name = ""
  #                       }
  #                     ]
  #                   }
  #                 ]
  #                 enforce = false
  #                 ports = []  # set(number)
  #                 validation = [  # list(object)
  #                   {
  #                     subject_alternative_names = [  # list(object)
  #                       {
  #                         match = [  # list(object)
  #                           {
  #                             exact = ...  # set(string)
  #                           }
  #                         ]
  #                       }
  #                     ]
  #                     trust = [  # list(object)
  #                       {
  #                         acm = [  # list(object)
  #                           {
  #                             certificate_authority_arns = ...  # set(string)
  #                           }
  #                         ]
  #                         file = [  # list(object)
  #                           {
  #                             certificate_chain = ...  # string
  #                           }
  #                         ]
  #                         sds = [  # list(object)
  #                           {
  #                             secret_name = ...  # string
  #                           }
  #                         ]
  #                       }
  #                     ]
  #                   }
  #                 ]
  #               }
  #             ]
  #           }
  #         ]
  #       }
  #     ]
  #     listener = [  # list(object)
  #       {
  #         connection_pool = [  # list(object)
  #           {
  #             grpc = [  # list(object)
  #               {
  #                 max_requests = 0
  #               }
  #             ]
  #             http = [  # list(object)
  #               {
  #                 max_connections = 0
  #                 max_pending_requests = 0
  #               }
  #             ]
  #             http2 = [  # list(object)
  #               {
  #                 max_requests = 0
  #               }
  #             ]
  #           }
  #         ]
  #         health_check = [  # list(object)
  #           {
  #             healthy_threshold = 0
  #             interval_millis = 0
  #             path = ""
  #             port = 0
  #             protocol = ""
  #             timeout_millis = 0
  #             unhealthy_threshold = 0
  #           }
  #         ]
  #         port_mapping = [  # list(object)
  #           {
  #             port = 0
  #             protocol = ""
  #           }
  #         ]
  #         tls = [  # list(object)
  #           {
  #             certificate = [  # list(object)
  #               {
  #                 acm = [  # list(object)
  #                   {
  #                     certificate_arn = ""
  #                   }
  #                 ]
  #                 file = [  # list(object)
  #                   {
  #                     certificate_chain = ""
  #                     private_key = ""
  #                   }
  #                 ]
  #                 sds = [  # list(object)
  #                   {
  #                     secret_name = ""
  #                   }
  #                 ]
  #               }
  #             ]
  #             mode = ""
  #             validation = [  # list(object)
  #               {
  #                 subject_alternative_names = [  # list(object)
  #                   {
  #                     match = [  # list(object)
  #                       {
  #                         exact = []  # set(string)
  #                       }
  #                     ]
  #                   }
  #                 ]
  #                 trust = [  # list(object)
  #                   {
  #                     file = [  # list(object)
  #                       {
  #                         certificate_chain = ""
  #                       }
  #                     ]
  #                     sds = [  # list(object)
  #                       {
  #                         secret_name = ""
  #                       }
  #                     ]
  #                   }
  #                 ]
  #               }
  #             ]
  #           }
  #         ]
  #       }
  #     ]
  #     logging = [  # list(object)
  #       {
  #         access_log = [  # list(object)
  #           {
  #             file = [  # list(object)
  #               {
  #                 format = [  # list(object)
  #                   {
  #                     json = [  # list(object)
  #                       {
  #                         key = ""
  #                         value = ""
  #                       }
  #                     ]
  #                     text = ""
  #                   }
  #                 ]
  #                 path = ""
  #               }
  #             ]
  #           }
  #         ]
  #       }
  #     ]
  #   }
  # ]

}

