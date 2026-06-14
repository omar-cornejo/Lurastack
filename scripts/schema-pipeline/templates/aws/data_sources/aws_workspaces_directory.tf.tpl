# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_workspaces_directory                                │
# └──────────────────────────────────────────────────────────────┘
data "aws_workspaces_directory" "this" {

  directory_id                      = ""     # string | required
  id                                = ""     # string | optional+computed
  tags                              = {}     # map(string) | optional+computed

  # active_directory_config = [  # set(object)
  #   {
  #     domain_name = ""
  #     service_account_secret_arn = ""
  #   }
  # ]
  # alias                             = ""     # string | computed
  # certificate_based_auth_properties = [  # list(object)
  #   {
  #     certificate_authority_arn = ""
  #     status = ""
  #   }
  # ]
  # customer_user_name                = ""     # string | computed
  # directory_name                    = ""     # string | computed
  # directory_type                    = ""     # string | computed
  # dns_ip_addresses                  = []     # set(string) | computed
  # iam_role_id                       = ""     # string | computed
  # ip_group_ids                      = []     # set(string) | computed
  # registration_code                 = ""     # string | computed
  # saml_properties = [  # list(object)
  #   {
  #     relay_state_parameter_name = ""
  #     status = ""
  #     user_access_url = ""
  #   }
  # ]
  # self_service_permissions = [  # list(object)
  #   {
  #     change_compute_type = false
  #     increase_volume_size = false
  #     rebuild_workspace = false
  #     restart_workspace = false
  #     switch_running_mode = false
  #   }
  # ]
  # subnet_ids                        = []     # set(string) | computed
  # user_identity_type                = ""     # string | computed
  # workspace_access_properties = [  # list(object)
  #   {
  #     device_type_android = ""
  #     device_type_chromeos = ""
  #     device_type_ios = ""
  #     device_type_linux = ""
  #     device_type_osx = ""
  #     device_type_web = ""
  #     device_type_windows = ""
  #     device_type_zeroclient = ""
  #   }
  # ]
  # workspace_creation_properties = [  # list(object)
  #   {
  #     custom_security_group_id = ""
  #     default_ou = ""
  #     enable_internet_access = false
  #     enable_maintenance_mode = false
  #     user_enabled_as_local_administrator = false
  #   }
  # ]
  # workspace_directory_description   = ""     # string | computed
  # workspace_directory_name          = ""     # string | computed
  # workspace_security_group_id       = ""     # string | computed
  # workspace_type                    = ""     # string | computed

}

