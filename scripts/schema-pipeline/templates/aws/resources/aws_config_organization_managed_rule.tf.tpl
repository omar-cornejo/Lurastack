# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_config_organization_managed_rule                │
# └──────────────────────────────────────────────────────────────┘
resource "aws_config_organization_managed_rule" "this" {

  name                        = ""     # string | required
  rule_identifier             = ""     # string | required
  description                 = ""     # string | optional
  excluded_accounts           = []     # set(string) | optional
  id                          = ""     # string | optional+computed
  input_parameters            = ""     # string | optional
  maximum_execution_frequency = ""     # string | optional
  resource_id_scope           = ""     # string | optional
  resource_types_scope        = []     # set(string) | optional
  tag_key_scope               = ""     # string | optional
  tag_value_scope             = ""     # string | optional

  # arn                         = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

