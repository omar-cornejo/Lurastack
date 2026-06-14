# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_transfer_user                                   │
# └──────────────────────────────────────────────────────────────┘
resource "aws_transfer_user" "this" {

  role                = ""     # string | required
  server_id           = ""     # string | required
  user_name           = ""     # string | required
  home_directory      = ""     # string | optional
  home_directory_type = ""     # string | optional
  id                  = ""     # string | optional+computed
  policy              = ""     # string | optional
  tags                = {}     # map(string) | optional
  tags_all            = {}     # map(string) | optional+computed

  # arn                 = ""     # string | computed

  home_directory_mappings { # list
    entry  = ""     # string | required
    target = ""     # string | required

  }

  posix_profile { # list [0..1]
    gid            = 0      # number | required
    uid            = 0      # number | required
    secondary_gids = []     # set(number) | optional

  }

  timeouts { # single
    delete = ""     # string | optional

  }

}

