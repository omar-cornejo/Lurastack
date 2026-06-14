# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_cloudfront_cache_policy                             │
# └──────────────────────────────────────────────────────────────┘
data "aws_cloudfront_cache_policy" "this" {

  id                                              = ""     # string | optional
  name                                            = ""     # string | optional

  # arn                                             = ""     # string | computed
  # comment                                         = ""     # string | computed
  # default_ttl                                     = 0      # number | computed
  # etag                                            = ""     # string | computed
  # max_ttl                                         = 0      # number | computed
  # min_ttl                                         = 0      # number | computed
  # parameters_in_cache_key_and_forwarded_to_origin = [  # list(object)
  #   {
  #     cookies_config = [  # list(object)
  #       {
  #         cookie_behavior = ""
  #         cookies = [  # list(object)
  #           {
  #             items = []  # set(string)
  #           }
  #         ]
  #       }
  #     ]
  #     enable_accept_encoding_brotli = false
  #     enable_accept_encoding_gzip = false
  #     headers_config = [  # list(object)
  #       {
  #         header_behavior = ""
  #         headers = [  # list(object)
  #           {
  #             items = []  # set(string)
  #           }
  #         ]
  #       }
  #     ]
  #     query_strings_config = [  # list(object)
  #       {
  #         query_string_behavior = ""
  #         query_strings = [  # list(object)
  #           {
  #             items = []  # set(string)
  #           }
  #         ]
  #       }
  #     ]
  #   }
  # ]

}

