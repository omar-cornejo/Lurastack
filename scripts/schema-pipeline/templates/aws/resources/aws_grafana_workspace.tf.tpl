# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_grafana_workspace                               │
# └──────────────────────────────────────────────────────────────┘
resource "aws_grafana_workspace" "this" {

  account_access_type       = ""     # string | required
  authentication_providers  = []     # list(string) | required
  permission_type           = ""     # string | required
  configuration             = ""     # string | optional+computed
  data_sources              = []     # list(string) | optional
  description               = ""     # string | optional
  grafana_version           = ""     # string | optional+computed
  id                        = ""     # string | optional+computed
  name                      = ""     # string | optional+computed
  notification_destinations = []     # list(string) | optional
  organization_role_name    = ""     # string | optional
  organizational_units      = []     # list(string) | optional
  role_arn                  = ""     # string | optional
  stack_set_name            = ""     # string | optional
  tags                      = {}     # map(string) | optional
  tags_all                  = {}     # map(string) | optional+computed

  # arn                       = ""     # string | computed
  # endpoint                  = ""     # string | computed
  # saml_configuration_status = ""     # string | computed

  network_access_control { # list [0..1]
    prefix_list_ids = []     # set(string) | required
    vpce_ids        = []     # set(string) | required

  }

  timeouts { # single
    create = ""     # string | optional
    update = ""     # string | optional

  }

  vpc_configuration { # list [0..1]
    security_group_ids = []     # set(string) | required
    subnet_ids         = []     # set(string) | required

  }

}

