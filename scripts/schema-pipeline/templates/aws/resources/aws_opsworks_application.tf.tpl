# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_opsworks_application                            │
# └──────────────────────────────────────────────────────────────┘
# ⚠ DEPRECATED: this resource type is deprecated
resource "aws_opsworks_application" "this" {

  name                      = ""     # string | required
  stack_id                  = ""     # string | required
  type                      = ""     # string | required
  auto_bundle_on_deploy     = ""     # string | optional
  aws_flow_ruby_settings    = ""     # string | optional
  data_source_arn           = ""     # string | optional
  data_source_database_name = ""     # string | optional
  data_source_type          = ""     # string | optional
  description               = ""     # string | optional
  document_root             = ""     # string | optional
  domains                   = []     # list(string) | optional
  enable_ssl                = false  # bool | optional
  id                        = ""     # string | optional+computed
  rails_env                 = ""     # string | optional
  short_name                = ""     # string | optional+computed

  app_source { # list
    type     = ""     # string | required
    password = ""     # string | optional+sensitive
    revision = ""     # string | optional
    ssh_key  = ""     # string | optional+sensitive
    url      = ""     # string | optional
    username = ""     # string | optional

  }

  environment { # set
    key    = ""     # string | required
    value  = ""     # string | required
    secure = false  # bool | optional

  }

  ssl_configuration { # list
    certificate = ""     # string | required
    private_key = ""     # string | required+sensitive
    chain       = ""     # string | optional

  }

}

