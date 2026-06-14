# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_datasync_location_smb                           │
# └──────────────────────────────────────────────────────────────┘
resource "aws_datasync_location_smb" "this" {

  agent_arns      = []     # set(string) | required
  password        = ""     # string | required+sensitive
  server_hostname = ""     # string | required
  subdirectory    = ""     # string | required
  user            = ""     # string | required
  domain          = ""     # string | optional+computed
  id              = ""     # string | optional+computed
  tags            = {}     # map(string) | optional
  tags_all        = {}     # map(string) | optional+computed

  # arn             = ""     # string | computed
  # uri             = ""     # string | computed

  mount_options { # list [0..1]
    version = ""     # string | optional

  }

}

