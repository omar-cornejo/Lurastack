# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_cloudfront_origin_request_policy                    │
# └──────────────────────────────────────────────────────────────┘
data "aws_cloudfront_origin_request_policy" "this" {

  id                   = ""     # string | optional
  name                 = ""     # string | optional

  # arn                  = ""     # string | computed
  # comment              = ""     # string | computed
  # cookies_config = [  # list(object)
  #   {
  #     cookie_behavior = ""
  #     cookies = [  # list(object)
  #       {
  #         items = []  # set(string)
  #       }
  #     ]
  #   }
  # ]
  # etag                 = ""     # string | computed
  # headers_config = [  # list(object)
  #   {
  #     header_behavior = ""
  #     headers = [  # list(object)
  #       {
  #         items = []  # set(string)
  #       }
  #     ]
  #   }
  # ]
  # query_strings_config = [  # list(object)
  #   {
  #     query_string_behavior = ""
  #     query_strings = [  # list(object)
  #       {
  #         items = []  # set(string)
  #       }
  #     ]
  #   }
  # ]

}

