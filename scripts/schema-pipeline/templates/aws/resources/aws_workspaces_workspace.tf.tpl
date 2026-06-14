# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_workspaces_workspace                            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_workspaces_workspace" "this" {

  bundle_id                      = ""     # string | required
  directory_id                   = ""     # string | required
  user_name                      = ""     # string | required
  id                             = ""     # string | optional+computed
  root_volume_encryption_enabled = false  # bool | optional
  tags                           = {}     # map(string) | optional
  tags_all                       = {}     # map(string) | optional+computed
  user_volume_encryption_enabled = false  # bool | optional
  volume_encryption_key          = ""     # string | optional

  # computer_name                  = ""     # string | computed
  # ip_address                     = ""     # string | computed
  # state                          = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

  workspace_properties { # list [0..1]
    compute_type_name                         = ""     # string | optional
    root_volume_size_gib                      = 0      # number | optional
    running_mode                              = ""     # string | optional
    running_mode_auto_stop_timeout_in_minutes = 0      # number | optional+computed
    user_volume_size_gib                      = 0      # number | optional

  }

}

