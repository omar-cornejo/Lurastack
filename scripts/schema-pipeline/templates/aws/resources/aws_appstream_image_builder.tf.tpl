# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_appstream_image_builder                         │
# └──────────────────────────────────────────────────────────────┘
resource "aws_appstream_image_builder" "this" {

  instance_type                  = ""     # string | required
  name                           = ""     # string | required
  appstream_agent_version        = ""     # string | optional+computed
  description                    = ""     # string | optional+computed
  display_name                   = ""     # string | optional+computed
  enable_default_internet_access = false  # bool | optional+computed
  iam_role_arn                   = ""     # string | optional+computed
  id                             = ""     # string | optional+computed
  image_arn                      = ""     # string | optional+computed
  image_name                     = ""     # string | optional+computed
  tags                           = {}     # map(string) | optional
  tags_all                       = {}     # map(string) | optional+computed

  # arn                            = ""     # string | computed
  # created_time                   = ""     # string | computed
  # state                          = ""     # string | computed

  access_endpoint { # set [0..4]
    endpoint_type = ""     # string | required
    vpce_id       = ""     # string | optional+computed

  }

  domain_join_info { # list [0..1]
    directory_name                         = ""     # string | optional
    organizational_unit_distinguished_name = ""     # string | optional

  }

  vpc_config { # list [0..1]
    security_group_ids = []     # set(string) | optional+computed
    subnet_ids         = []     # set(string) | optional+computed

  }

}

