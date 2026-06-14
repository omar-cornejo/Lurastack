# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_sagemaker_workforce                             │
# └──────────────────────────────────────────────────────────────┘
resource "aws_sagemaker_workforce" "this" {

  workforce_name = ""     # string | required
  id             = ""     # string | optional+computed

  # arn            = ""     # string | computed
  # subdomain      = ""     # string | computed

  cognito_config { # list [0..1]
    client_id = ""     # string | required
    user_pool = ""     # string | required

  }

  oidc_config { # list [0..1]
    authorization_endpoint              = ""     # string | required
    client_id                           = ""     # string | required
    client_secret                       = ""     # string | required+sensitive
    issuer                              = ""     # string | required
    jwks_uri                            = ""     # string | required
    logout_endpoint                     = ""     # string | required
    token_endpoint                      = ""     # string | required
    user_info_endpoint                  = ""     # string | required
    authentication_request_extra_params = {}     # map(string) | optional
    scope                               = ""     # string | optional

  }

  source_ip_config { # list [0..1]
    cidrs = []     # set(string) | required

  }

  workforce_vpc_config { # list [0..1]
    security_group_ids = []     # set(string) | optional
    subnets            = []     # set(string) | optional
    vpc_id             = ""     # string | optional

    # vpc_endpoint_id    = ""     # string | computed

  }

}

