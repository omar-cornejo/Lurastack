# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_workspacesweb_user_settings                     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_workspacesweb_user_settings" "this" {

  copy_allowed                       = ""     # string | required
  download_allowed                   = ""     # string | required
  paste_allowed                      = ""     # string | required
  print_allowed                      = ""     # string | required
  upload_allowed                     = ""     # string | required
  additional_encryption_context      = {}     # map(string) | optional
  customer_managed_key               = ""     # string | optional
  deep_link_allowed                  = ""     # string | optional+computed
  disconnect_timeout_in_minutes      = 0      # number | optional
  idle_disconnect_timeout_in_minutes = 0      # number | optional
  tags                               = {}     # map(string) | optional

  # associated_portal_arns             = []     # list(string) | computed
  # tags_all                           = {}     # map(string) | computed
  # user_settings_arn                  = ""     # string | computed

  cookie_synchronization_configuration { # list

    allowlist { # list
      domain = ""     # string | required
      name   = ""     # string | optional
      path   = ""     # string | optional

    }

    blocklist { # list
      domain = ""     # string | required
      name   = ""     # string | optional
      path   = ""     # string | optional

    }

  }

  toolbar_configuration { # list
    hidden_toolbar_items   = []     # list(string) | optional
    max_display_resolution = ""     # string | optional
    toolbar_type           = ""     # string | optional
    visual_mode            = ""     # string | optional

  }

}

