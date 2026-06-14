# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_cloudfront_response_headers_policy                  │
# └──────────────────────────────────────────────────────────────┘
data "aws_cloudfront_response_headers_policy" "this" {

  id                           = ""     # string | optional+computed
  name                         = ""     # string | optional+computed

  # arn                          = ""     # string | computed
  # comment                      = ""     # string | computed
  # cors_config = [  # list(object)
  #   {
  #     access_control_allow_credentials = false
  #     access_control_allow_headers = [  # list(object)
  #       {
  #         items = []  # set(string)
  #       }
  #     ]
  #     access_control_allow_methods = [  # list(object)
  #       {
  #         items = []  # set(string)
  #       }
  #     ]
  #     access_control_allow_origins = [  # list(object)
  #       {
  #         items = []  # set(string)
  #       }
  #     ]
  #     access_control_expose_headers = [  # list(object)
  #       {
  #         items = []  # set(string)
  #       }
  #     ]
  #     access_control_max_age_sec = 0
  #     origin_override = false
  #   }
  # ]
  # custom_headers_config = [  # list(object)
  #   {
  #     items = [  # set(object)
  #       {
  #         header = ""
  #         override = false
  #         value = ""
  #       }
  #     ]
  #   }
  # ]
  # etag                         = ""     # string | computed
  # remove_headers_config = [  # list(object)
  #   {
  #     items = [  # set(object)
  #       {
  #         header = ""
  #       }
  #     ]
  #   }
  # ]
  # security_headers_config = [  # list(object)
  #   {
  #     content_security_policy = [  # list(object)
  #       {
  #         content_security_policy = ""
  #         override = false
  #       }
  #     ]
  #     content_type_options = [  # list(object)
  #       {
  #         override = false
  #       }
  #     ]
  #     frame_options = [  # list(object)
  #       {
  #         frame_option = ""
  #         override = false
  #       }
  #     ]
  #     referrer_policy = [  # list(object)
  #       {
  #         override = false
  #         referrer_policy = ""
  #       }
  #     ]
  #     strict_transport_security = [  # list(object)
  #       {
  #         access_control_max_age_sec = 0
  #         include_subdomains = false
  #         override = false
  #         preload = false
  #       }
  #     ]
  #     xss_protection = [  # list(object)
  #       {
  #         mode_block = false
  #         override = false
  #         protection = false
  #         report_uri = ""
  #       }
  #     ]
  #   }
  # ]
  # server_timing_headers_config = [  # list(object)
  #   {
  #     enabled = false
  #     sampling_rate = 0
  #   }
  # ]

}

