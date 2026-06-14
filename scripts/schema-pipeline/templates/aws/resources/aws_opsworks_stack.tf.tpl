# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_opsworks_stack                                  │
# └──────────────────────────────────────────────────────────────┘
# ⚠ DEPRECATED: this resource type is deprecated
resource "aws_opsworks_stack" "this" {

  default_instance_profile_arn  = ""     # string | required
  name                          = ""     # string | required
  region                        = ""     # string | required
  service_role_arn              = ""     # string | required
  agent_version                 = ""     # string | optional+computed
  berkshelf_version             = ""     # string | optional
  color                         = ""     # string | optional
  configuration_manager_name    = ""     # string | optional
  configuration_manager_version = ""     # string | optional
  custom_json                   = ""     # string | optional
  default_availability_zone     = ""     # string | optional+computed
  default_os                    = ""     # string | optional
  default_root_device_type      = ""     # string | optional
  default_ssh_key_name          = ""     # string | optional
  default_subnet_id             = ""     # string | optional+computed
  hostname_theme                = ""     # string | optional
  id                            = ""     # string | optional+computed
  manage_berkshelf              = false  # bool | optional
  tags                          = {}     # map(string) | optional
  tags_all                      = {}     # map(string) | optional+computed
  use_custom_cookbooks          = false  # bool | optional
  use_opsworks_security_groups  = false  # bool | optional
  vpc_id                        = ""     # string | optional+computed

  # arn                           = ""     # string | computed
  # stack_endpoint                = ""     # string | computed

  custom_cookbooks_source { # list [0..1]
    type     = ""     # string | required
    url      = ""     # string | required
    password = ""     # string | optional+sensitive
    revision = ""     # string | optional
    ssh_key  = ""     # string | optional+sensitive
    username = ""     # string | optional

  }

  timeouts { # single
    create = ""     # string | optional

  }

}

