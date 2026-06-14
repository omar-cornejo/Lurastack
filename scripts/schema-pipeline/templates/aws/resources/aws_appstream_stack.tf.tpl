# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_appstream_stack                                 │
# └──────────────────────────────────────────────────────────────┘
resource "aws_appstream_stack" "this" {

  name               = ""     # string | required
  description        = ""     # string | optional
  display_name       = ""     # string | optional
  embed_host_domains = []     # set(string) | optional+computed
  feedback_url       = ""     # string | optional+computed
  id                 = ""     # string | optional+computed
  redirect_url       = ""     # string | optional+computed
  tags               = {}     # map(string) | optional
  tags_all           = {}     # map(string) | optional+computed

  # arn                = ""     # string | computed
  # created_time       = ""     # string | computed

  access_endpoints { # set [0..4]
    endpoint_type = ""     # string | required
    vpce_id       = ""     # string | optional+computed

  }

  application_settings { # list [0..1]
    enabled        = false  # bool | required
    settings_group = ""     # string | optional

  }

  storage_connectors { # set
    connector_type      = ""     # string | required
    domains             = []     # list(string) | optional+computed
    resource_identifier = ""     # string | optional+computed

  }

  streaming_experience_settings { # list [0..1]
    preferred_protocol = ""     # string | optional

  }

  user_settings { # set
    action     = ""     # string | required
    permission = ""     # string | required

  }

}

