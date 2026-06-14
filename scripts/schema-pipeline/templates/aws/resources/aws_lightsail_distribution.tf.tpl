# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_lightsail_distribution                          │
# └──────────────────────────────────────────────────────────────┘
resource "aws_lightsail_distribution" "this" {

  bundle_id                = ""     # string | required | The bundle ID to use for the distribution.
  name                     = ""     # string | required | The name of the distribution.
  certificate_name         = ""     # string | optional | The name of the SSL/TLS certificate attached to the distribu…
  id                       = ""     # string | optional+computed
  ip_address_type          = ""     # string | optional | The IP address type of the distribution.
  is_enabled               = false  # bool | optional | Indicates whether the distribution is enabled.
  tags                     = {}     # map(string) | optional
  tags_all                 = {}     # map(string) | optional+computed

  # alternative_domain_names = []     # list(string) | computed | The alternate domain names of the distribution.
  # arn                      = ""     # string | computed | The Amazon Resource Name (ARN) of the distribution.
  # created_at               = ""     # string | computed | The timestamp when the distribution was created.
  # domain_name              = ""     # string | computed | The domain name of the distribution.
  # location = [  # list(object)
  #   {
  #     availability_zone = ""
  #     region_name = ""
  #   }
  # ]
  # origin_public_dns        = ""     # string | computed | The public DNS of the origin.
  # resource_type            = ""     # string | computed | The Lightsail resource type (e.g., Distribution).
  # status                   = ""     # string | computed | The status of the distribution.
  # support_code             = ""     # string | computed | The support code. Include this code in your email to support…

  cache_behavior { # set
    behavior = ""     # string | required | The cache behavior for the specified path.
    path     = ""     # string | required | The path to a directory or file to cached, or not cache. Use…

  }

  cache_behavior_settings { # list [0..1]
    allowed_http_methods = ""     # string | optional | The HTTP methods that are processed and forwarded to the dis…
    cached_http_methods  = ""     # string | optional | The HTTP method responses that are cached by your distributi…
    default_ttl          = 0      # number | optional | The default amount of time that objects stay in the distribu…
    maximum_ttl          = 0      # number | optional | The maximum amount of time that objects stay in the distribu…
    minimum_ttl          = 0      # number | optional | The minimum amount of time that objects stay in the distribu…

    forwarded_cookies { # list [0..1]
      cookies_allow_list = []     # set(string) | optional | The specific cookies to forward to your distribution's origi…
      option             = ""     # string | optional | Specifies which cookies to forward to the distribution's ori…

    }

    forwarded_headers { # list [0..1]
      headers_allow_list = []     # set(string) | optional | The specific headers to forward to your distribution's origi…
      option             = ""     # string | optional | The headers that you want your distribution to forward to yo…

    }

    forwarded_query_strings { # list [0..1]
      option                     = false  # bool | optional | Indicates whether the distribution forwards and caches based…
      query_strings_allowed_list = []     # set(string) | optional | The specific query strings that the distribution forwards to…

    }

  }

  default_cache_behavior { # list [1..1]
    behavior = ""     # string | required | The cache behavior of the distribution.

  }

  origin { # list [1..1]
    name            = ""     # string | required | The name of the origin resource.
    region_name     = ""     # string | required | The AWS Region name of the origin resource.
    protocol_policy = ""     # string | optional | The protocol that your Amazon Lightsail distribution uses wh…

    # resource_type   = ""     # string | computed | The resource type of the origin resource (e.g., Instance).

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

