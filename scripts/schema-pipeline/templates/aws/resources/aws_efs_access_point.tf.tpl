# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_efs_access_point                                │
# └──────────────────────────────────────────────────────────────┘
resource "aws_efs_access_point" "this" {

  file_system_id  = ""     # string | required
  id              = ""     # string | optional+computed
  tags            = {}     # map(string) | optional
  tags_all        = {}     # map(string) | optional+computed

  # arn             = ""     # string | computed
  # file_system_arn = ""     # string | computed
  # owner_id        = ""     # string | computed

  posix_user { # list [0..1]
    gid            = 0      # number | required
    uid            = 0      # number | required
    secondary_gids = []     # set(number) | optional

  }

  root_directory { # list [0..1]
    path = ""     # string | optional+computed

    creation_info { # list [0..1]
      owner_gid   = 0      # number | required
      owner_uid   = 0      # number | required
      permissions = ""     # string | required

    }

  }

}

