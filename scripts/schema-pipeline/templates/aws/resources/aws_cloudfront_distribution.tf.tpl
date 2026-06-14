# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_cloudfront_distribution                         │
# └──────────────────────────────────────────────────────────────┘
resource "aws_cloudfront_distribution" "this" {

  enabled                         = false  # bool | required
  aliases                         = []     # set(string) | optional
  comment                         = ""     # string | optional
  continuous_deployment_policy_id = ""     # string | optional+computed
  default_root_object             = ""     # string | optional
  http_version                    = ""     # string | optional
  id                              = ""     # string | optional+computed
  is_ipv6_enabled                 = false  # bool | optional
  price_class                     = ""     # string | optional
  retain_on_delete                = false  # bool | optional
  staging                         = false  # bool | optional
  tags                            = {}     # map(string) | optional
  tags_all                        = {}     # map(string) | optional+computed
  wait_for_deployment             = false  # bool | optional
  web_acl_id                      = ""     # string | optional

  # arn                             = ""     # string | computed
  # caller_reference                = ""     # string | computed
  # domain_name                     = ""     # string | computed
  # etag                            = ""     # string | computed
  # hosted_zone_id                  = ""     # string | computed
  # in_progress_validation_batches  = 0      # number | computed
  # last_modified_time              = ""     # string | computed
  # status                          = ""     # string | computed
  # trusted_key_groups = [  # list(object)
  #   {
  #     enabled = false
  #     items = [  # list(object)
  #       {
  #         key_group_id = ""
  #         key_pair_ids = []  # set(string)
  #       }
  #     ]
  #   }
  # ]
  # trusted_signers = [  # list(object)
  #   {
  #     enabled = false
  #     items = [  # list(object)
  #       {
  #         aws_account_number = ""
  #         key_pair_ids = []  # set(string)
  #       }
  #     ]
  #   }
  # ]

  custom_error_response { # set
    error_code            = 0      # number | required
    error_caching_min_ttl = 0      # number | optional
    response_code         = 0      # number | optional
    response_page_path    = ""     # string | optional

  }

  default_cache_behavior { # list [1..1]
    allowed_methods            = []     # set(string) | required
    cached_methods             = []     # set(string) | required
    target_origin_id           = ""     # string | required
    viewer_protocol_policy     = ""     # string | required
    cache_policy_id            = ""     # string | optional
    compress                   = false  # bool | optional
    default_ttl                = 0      # number | optional+computed
    field_level_encryption_id  = ""     # string | optional
    max_ttl                    = 0      # number | optional+computed
    min_ttl                    = 0      # number | optional
    origin_request_policy_id   = ""     # string | optional
    realtime_log_config_arn    = ""     # string | optional
    response_headers_policy_id = ""     # string | optional
    smooth_streaming           = false  # bool | optional
    trusted_key_groups         = []     # list(string) | optional+computed
    trusted_signers            = []     # list(string) | optional+computed

    forwarded_values { # list [0..1]
      query_string            = false  # bool | required
      headers                 = []     # set(string) | optional+computed
      query_string_cache_keys = []     # list(string) | optional+computed

      cookies { # list [1..1]
        forward           = ""     # string | required
        whitelisted_names = []     # set(string) | optional+computed

      }

    }

    function_association { # set [0..2]
      event_type   = ""     # string | required
      function_arn = ""     # string | required

    }

    grpc_config { # list [0..1]
      enabled = false  # bool | optional+computed

    }

    lambda_function_association { # set [0..4]
      event_type   = ""     # string | required
      lambda_arn   = ""     # string | required
      include_body = false  # bool | optional

    }

  }

  logging_config { # list [0..1]
    bucket          = ""     # string | required
    include_cookies = false  # bool | optional
    prefix          = ""     # string | optional

  }

  ordered_cache_behavior { # list
    allowed_methods            = []     # set(string) | required
    cached_methods             = []     # set(string) | required
    path_pattern               = ""     # string | required
    target_origin_id           = ""     # string | required
    viewer_protocol_policy     = ""     # string | required
    cache_policy_id            = ""     # string | optional
    compress                   = false  # bool | optional
    default_ttl                = 0      # number | optional+computed
    field_level_encryption_id  = ""     # string | optional
    max_ttl                    = 0      # number | optional+computed
    min_ttl                    = 0      # number | optional
    origin_request_policy_id   = ""     # string | optional
    realtime_log_config_arn    = ""     # string | optional
    response_headers_policy_id = ""     # string | optional
    smooth_streaming           = false  # bool | optional
    trusted_key_groups         = []     # list(string) | optional
    trusted_signers            = []     # list(string) | optional

    forwarded_values { # list [0..1]
      query_string            = false  # bool | required
      headers                 = []     # set(string) | optional+computed
      query_string_cache_keys = []     # list(string) | optional+computed

      cookies { # list [1..1]
        forward           = ""     # string | required
        whitelisted_names = []     # set(string) | optional

      }

    }

    function_association { # set [0..2]
      event_type   = ""     # string | required
      function_arn = ""     # string | required

    }

    grpc_config { # list [0..1]
      enabled = false  # bool | optional+computed

    }

    lambda_function_association { # set [0..4]
      event_type   = ""     # string | required
      lambda_arn   = ""     # string | required
      include_body = false  # bool | optional

    }

  }

  origin { # set [1..*]
    domain_name              = ""     # string | required
    origin_id                = ""     # string | required
    connection_attempts      = 0      # number | optional
    connection_timeout       = 0      # number | optional
    origin_access_control_id = ""     # string | optional
    origin_path              = ""     # string | optional

    custom_header { # set
      name  = ""     # string | required
      value = ""     # string | required

    }

    custom_origin_config { # list [0..1]
      http_port                = 0      # number | required
      https_port               = 0      # number | required
      origin_protocol_policy   = ""     # string | required
      origin_ssl_protocols     = []     # set(string) | required
      origin_keepalive_timeout = 0      # number | optional
      origin_read_timeout      = 0      # number | optional

    }

    origin_shield { # list [0..1]
      enabled              = false  # bool | required
      origin_shield_region = ""     # string | optional

    }

    s3_origin_config { # list [0..1]
      origin_access_identity = ""     # string | required

    }

    vpc_origin_config { # list [0..1]
      vpc_origin_id            = ""     # string | required
      origin_keepalive_timeout = 0      # number | optional
      origin_read_timeout      = 0      # number | optional

    }

  }

  origin_group { # set
    origin_id = ""     # string | required

    failover_criteria { # list [1..1]
      status_codes = []     # set(number) | required

    }

    member { # list [2..2]
      origin_id = ""     # string | required

    }

  }

  restrictions { # list [1..1]

    geo_restriction { # list [1..1]
      restriction_type = ""     # string | required
      locations        = []     # set(string) | optional+computed

    }

  }

  viewer_certificate { # list [1..1]
    acm_certificate_arn            = ""     # string | optional
    cloudfront_default_certificate = false  # bool | optional
    iam_certificate_id             = ""     # string | optional
    minimum_protocol_version       = ""     # string | optional
    ssl_support_method             = ""     # string | optional

  }

}

