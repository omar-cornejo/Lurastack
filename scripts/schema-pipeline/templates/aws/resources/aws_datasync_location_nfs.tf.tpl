# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_datasync_location_nfs                           │
# └──────────────────────────────────────────────────────────────┘
resource "aws_datasync_location_nfs" "this" {

  server_hostname = ""     # string | required
  subdirectory    = ""     # string | required
  id              = ""     # string | optional+computed
  tags            = {}     # map(string) | optional
  tags_all        = {}     # map(string) | optional+computed

  # arn             = ""     # string | computed
  # uri             = ""     # string | computed

  mount_options { # list [0..1]
    version = ""     # string | optional

  }

  on_prem_config { # list [1..1]
    agent_arns = []     # set(string) | required

  }

}

