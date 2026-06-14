# ┌──────────────────────────────────────────────────────────────┐
# │  data: google_compute_security_policy                          │
# └──────────────────────────────────────────────────────────────┘
data "google_compute_security_policy" "this" {

  id                         = ""     # string | optional+computed
  name                       = ""     # string | optional | The name of the security policy.
  project                    = ""     # string | optional | The project in which the resource belongs. If it is not prov…
  self_link                  = ""     # string | optional | The URI of the created resource.

  # adaptive_protection_config = [  # list(object)
  #   {
  #     layer_7_ddos_defense_config = [  # list(object)
  #       {
  #         enable = false
  #         rule_visibility = ""
  #       }
  #     ]
  #   }
  # ]
  # advanced_options_config = [  # list(object)
  #   {
  #     json_custom_config = [  # list(object)
  #       {
  #         content_types = []  # set(string)
  #       }
  #     ]
  #     json_parsing = ""
  #     log_level = ""
  #     user_ip_request_headers = []  # set(string)
  #   }
  # ]
  # description                = ""     # string | computed | An optional description of this security policy. Max size is…
  # fingerprint                = ""     # string | computed | Fingerprint of this resource.
  # recaptcha_options_config = [  # list(object)
  #   {
  #     redirect_site_key = ""
  #   }
  # ]
  # rule = [  # set(object)
  #   {
  #     action = ""
  #     description = ""
  #     header_action = [  # list(object)
  #       {
  #         request_headers_to_adds = [  # list(object)
  #           {
  #             header_name = ""
  #             header_value = ""
  #           }
  #         ]
  #       }
  #     ]
  #     match = [  # list(object)
  #       {
  #         config = [  # list(object)
  #           {
  #             src_ip_ranges = []  # set(string)
  #           }
  #         ]
  #         expr = [  # list(object)
  #           {
  #             expression = ""
  #           }
  #         ]
  #         expr_options = [  # list(object)
  #           {
  #             recaptcha_options = [  # list(object)
  #               {
  #                 action_token_site_keys = []  # list(string)
  #                 session_token_site_keys = []  # list(string)
  #               }
  #             ]
  #           }
  #         ]
  #         versioned_expr = ""
  #       }
  #     ]
  #     preview = false
  #     priority = 0
  #     rate_limit_options = [  # list(object)
  #       {
  #         ban_duration_sec = 0
  #         ban_threshold = [  # list(object)
  #           {
  #             count = 0
  #             interval_sec = 0
  #           }
  #         ]
  #         conform_action = ""
  #         enforce_on_key = ""
  #         enforce_on_key_name = ""
  #         exceed_action = ""
  #         exceed_redirect_options = [  # list(object)
  #           {
  #             target = ""
  #             type = ""
  #           }
  #         ]
  #         rate_limit_threshold = [  # list(object)
  #           {
  #             count = 0
  #             interval_sec = 0
  #           }
  #         ]
  #       }
  #     ]
  #     redirect_options = [  # list(object)
  #       {
  #         target = ""
  #         type = ""
  #       }
  #     ]
  #   }
  # ]
  # type                       = ""     # string | computed | The type indicates the intended use of the security policy. …

}

