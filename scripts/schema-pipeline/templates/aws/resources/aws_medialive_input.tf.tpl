# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_medialive_input                                 │
# └──────────────────────────────────────────────────────────────┘
resource "aws_medialive_input" "this" {

  name                  = ""     # string | required
  type                  = ""     # string | required
  id                    = ""     # string | optional+computed
  input_security_groups = []     # list(string) | optional
  role_arn              = ""     # string | optional+computed
  tags                  = {}     # map(string) | optional
  tags_all              = {}     # map(string) | optional+computed

  # arn                   = ""     # string | computed
  # attached_channels     = []     # list(string) | computed
  # input_class           = ""     # string | computed
  # input_partner_ids     = []     # list(string) | computed
  # input_source_type     = ""     # string | computed

  destinations { # set
    stream_name = ""     # string | required

  }

  input_devices { # set
    id = ""     # string | required

  }

  media_connect_flows { # set
    flow_arn = ""     # string | required

  }

  sources { # set
    password_param = ""     # string | required
    url            = ""     # string | required
    username       = ""     # string | required

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

  vpc { # list [0..1]
    subnet_ids         = []     # list(string) | required
    security_group_ids = []     # list(string) | optional

  }

}

