# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_transfer_access                                 │
# └──────────────────────────────────────────────────────────────┘
resource "aws_transfer_access" "this" {

  external_id         = ""     # string | required
  server_id           = ""     # string | required
  home_directory      = ""     # string | optional
  home_directory_type = ""     # string | optional
  id                  = ""     # string | optional+computed
  policy              = ""     # string | optional
  role                = ""     # string | optional

  home_directory_mappings { # list [0..50]
    entry  = ""     # string | required
    target = ""     # string | required

  }

  posix_profile { # list [0..1]
    gid            = 0      # number | required
    uid            = 0      # number | required
    secondary_gids = []     # set(number) | optional

  }

}

