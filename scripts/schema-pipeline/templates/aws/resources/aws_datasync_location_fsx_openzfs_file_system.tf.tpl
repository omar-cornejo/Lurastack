# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_datasync_location_fsx_openzfs_file_system       │
# └──────────────────────────────────────────────────────────────┘
resource "aws_datasync_location_fsx_openzfs_file_system" "this" {

  fsx_filesystem_arn  = ""     # string | required
  security_group_arns = []     # set(string) | required
  id                  = ""     # string | optional+computed
  subdirectory        = ""     # string | optional+computed
  tags                = {}     # map(string) | optional
  tags_all            = {}     # map(string) | optional+computed

  # arn                 = ""     # string | computed
  # creation_time       = ""     # string | computed
  # uri                 = ""     # string | computed

  protocol { # list [1..1]

    nfs { # list [1..1]

      mount_options { # list [1..1]
        version = ""     # string | optional

      }

    }

  }

}

