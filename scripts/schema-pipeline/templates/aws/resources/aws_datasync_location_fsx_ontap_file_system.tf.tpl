# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_datasync_location_fsx_ontap_file_system         │
# └──────────────────────────────────────────────────────────────┘
resource "aws_datasync_location_fsx_ontap_file_system" "this" {

  security_group_arns         = []     # set(string) | required
  storage_virtual_machine_arn = ""     # string | required
  id                          = ""     # string | optional+computed
  subdirectory                = ""     # string | optional+computed
  tags                        = {}     # map(string) | optional
  tags_all                    = {}     # map(string) | optional+computed

  # arn                         = ""     # string | computed
  # creation_time               = ""     # string | computed
  # fsx_filesystem_arn          = ""     # string | computed
  # uri                         = ""     # string | computed

  protocol { # list [1..1]

    nfs { # list [0..1]

      mount_options { # list [1..1]
        version = ""     # string | optional

      }

    }

    smb { # list [0..1]
      password = ""     # string | required+sensitive
      user     = ""     # string | required
      domain   = ""     # string | optional

      mount_options { # list [1..1]
        version = ""     # string | optional

      }

    }

  }

}

