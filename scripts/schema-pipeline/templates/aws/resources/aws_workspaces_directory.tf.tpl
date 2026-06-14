# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_workspaces_directory                            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_workspaces_directory" "this" {

  directory_id                    = ""     # string | optional+computed
  id                              = ""     # string | optional+computed
  ip_group_ids                    = []     # set(string) | optional+computed
  subnet_ids                      = []     # set(string) | optional+computed
  tags                            = {}     # map(string) | optional
  tags_all                        = {}     # map(string) | optional+computed
  user_identity_type              = ""     # string | optional+computed
  workspace_directory_description = ""     # string | optional
  workspace_directory_name        = ""     # string | optional
  workspace_type                  = ""     # string | optional

  # alias                           = ""     # string | computed
  # customer_user_name              = ""     # string | computed
  # directory_name                  = ""     # string | computed
  # directory_type                  = ""     # string | computed
  # dns_ip_addresses                = []     # set(string) | computed
  # iam_role_id                     = ""     # string | computed
  # registration_code               = ""     # string | computed
  # workspace_security_group_id     = ""     # string | computed

  active_directory_config { # list [0..1]
    domain_name                = ""     # string | required
    service_account_secret_arn = ""     # string | required

  }

  certificate_based_auth_properties { # list [0..1]
    certificate_authority_arn = ""     # string | optional
    status                    = ""     # string | optional+computed

  }

  saml_properties { # list [0..1]
    relay_state_parameter_name = ""     # string | optional
    status                     = ""     # string | optional
    user_access_url            = ""     # string | optional

  }

  self_service_permissions { # list [0..1]
    change_compute_type  = false  # bool | optional
    increase_volume_size = false  # bool | optional
    rebuild_workspace    = false  # bool | optional
    restart_workspace    = false  # bool | optional
    switch_running_mode  = false  # bool | optional

  }

  workspace_access_properties { # list [0..1]
    device_type_android    = ""     # string | optional
    device_type_chromeos   = ""     # string | optional
    device_type_ios        = ""     # string | optional
    device_type_linux      = ""     # string | optional
    device_type_osx        = ""     # string | optional
    device_type_web        = ""     # string | optional
    device_type_windows    = ""     # string | optional
    device_type_zeroclient = ""     # string | optional

  }

  workspace_creation_properties { # list [0..1]
    custom_security_group_id            = ""     # string | optional
    default_ou                          = ""     # string | optional
    enable_internet_access              = false  # bool | optional
    enable_maintenance_mode             = false  # bool | optional
    user_enabled_as_local_administrator = false  # bool | optional

  }

}

