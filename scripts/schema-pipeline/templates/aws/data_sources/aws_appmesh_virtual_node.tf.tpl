# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_appmesh_virtual_node                                │
# └──────────────────────────────────────────────────────────────┘
data "aws_appmesh_virtual_node" "this" {

  mesh_name         = ""     # string | required
  name              = ""     # string | required
  id                = ""     # string | optional+computed
  mesh_owner        = ""     # string | optional+computed
  tags              = {}     # map(string) | optional+computed

  # arn               = ""     # string | computed
  # created_date      = ""     # string | computed
  # last_updated_date = ""     # string | computed
  # resource_owner    = ""     # string | computed
  # spec = [  # list(object)
  #   {
  #     backend = [  # set(object)
  #       {
  #         virtual_service = [  # list(object)
  #           {
  #             client_policy = [  # list(object)
  #               {
  #                 tls = [  # list(object)
  #                   {
  #                     certificate = [  # list(object)
  #                       {
  #                         file = [  # list(object)
  #                           {
  #                             certificate_chain = ...  # string
  #                             private_key = ...  # string
  #                           }
  #                         ]
  #                         sds = [  # list(object)
  #                           {
  #                             secret_name = ...  # string
  #                           }
  #                         ]
  #                       }
  #                     ]
  #                     enforce = false
  #                     ports = []  # set(number)
  #                     validation = [  # list(object)
  #                       {
  #                         subject_alternative_names = [  # list(object)
  #                           {
  #                             match = ...  # list(object({ exact: set(string) }))
  #                           }
  #                         ]
  #                         trust = [  # list(object)
  #                           {
  #                             acm = ...  # list(object({ certificate_authority_arns: set(string) }))
  #                             file = ...  # list(object({ certificate_chain: string }))
  #                             sds = ...  # list(object({ secret_name: string }))
  #                           }
  #                         ]
  #                       }
  #                     ]
  #                   }
  #                 ]
  #               }
  #             ]
  #             virtual_service_name = ""
  #           }
  #         ]
  #       }
  #     ]
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
  #             tcp = [  # list(object)
  #               {
  #                 max_connections = 0
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
  #         outlier_detection = [  # list(object)
  #           {
  #             base_ejection_duration = [  # list(object)
  #               {
  #                 unit = ""
  #                 value = 0
  #               }
  #             ]
  #             interval = [  # list(object)
  #               {
  #                 unit = ""
  #                 value = 0
  #               }
  #             ]
  #             max_ejection_percent = 0
  #             max_server_errors = 0
  #           }
  #         ]
  #         port_mapping = [  # list(object)
  #           {
  #             port = 0
  #             protocol = ""
  #           }
  #         ]
  #         timeout = [  # list(object)
  #           {
  #             grpc = [  # list(object)
  #               {
  #                 idle = [  # list(object)
  #                   {
  #                     unit = ""
  #                     value = 0
  #                   }
  #                 ]
  #                 per_request = [  # list(object)
  #                   {
  #                     unit = ""
  #                     value = 0
  #                   }
  #                 ]
  #               }
  #             ]
  #             http = [  # list(object)
  #               {
  #                 idle = [  # list(object)
  #                   {
  #                     unit = ""
  #                     value = 0
  #                   }
  #                 ]
  #                 per_request = [  # list(object)
  #                   {
  #                     unit = ""
  #                     value = 0
  #                   }
  #                 ]
  #               }
  #             ]
  #             http2 = [  # list(object)
  #               {
  #                 idle = [  # list(object)
  #                   {
  #                     unit = ""
  #                     value = 0
  #                   }
  #                 ]
  #                 per_request = [  # list(object)
  #                   {
  #                     unit = ""
  #                     value = 0
  #                   }
  #                 ]
  #               }
  #             ]
  #             tcp = [  # list(object)
  #               {
  #                 idle = [  # list(object)
  #                   {
  #                     unit = ""
  #                     value = 0
  #                   }
  #                 ]
  #               }
  #             ]
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
  #     service_discovery = [  # list(object)
  #       {
  #         aws_cloud_map = [  # list(object)
  #           {
  #             attributes = {}  # map(string)
  #             namespace_name = ""
  #             service_name = ""
  #           }
  #         ]
  #         dns = [  # list(object)
  #           {
  #             hostname = ""
  #             ip_preference = ""
  #             response_type = ""
  #           }
  #         ]
  #       }
  #     ]
  #   }
  # ]

}

