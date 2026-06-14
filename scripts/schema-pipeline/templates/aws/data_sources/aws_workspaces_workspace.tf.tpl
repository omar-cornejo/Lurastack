# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_workspaces_workspace                                │
# └──────────────────────────────────────────────────────────────┘
data "aws_workspaces_workspace" "this" {

  directory_id                   = ""     # string | optional+computed
  id                             = ""     # string | optional+computed
  tags                           = {}     # map(string) | optional+computed
  user_name                      = ""     # string | optional+computed
  workspace_id                   = ""     # string | optional+computed

  # bundle_id                      = ""     # string | computed
  # computer_name                  = ""     # string | computed
  # ip_address                     = ""     # string | computed
  # root_volume_encryption_enabled = false  # bool | computed
  # state                          = ""     # string | computed
  # user_volume_encryption_enabled = false  # bool | computed
  # volume_encryption_key          = ""     # string | computed
  # workspace_properties = [  # list(object)
  #   {
  #     compute_type_name = ""
  #     root_volume_size_gib = 0
  #     running_mode = ""
  #     running_mode_auto_stop_timeout_in_minutes = 0
  #     user_volume_size_gib = 0
  #   }
  # ]

}

