# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_datasync_location_azure_blob                    │
# └──────────────────────────────────────────────────────────────┘
resource "aws_datasync_location_azure_blob" "this" {

  agent_arns          = []     # set(string) | required
  authentication_type = ""     # string | required
  container_url       = ""     # string | required
  access_tier         = ""     # string | optional
  blob_type           = ""     # string | optional
  id                  = ""     # string | optional+computed
  subdirectory        = ""     # string | optional+computed
  tags                = {}     # map(string) | optional
  tags_all            = {}     # map(string) | optional+computed

  # arn                 = ""     # string | computed
  # uri                 = ""     # string | computed

  sas_configuration { # list [0..1]
    token = ""     # string | required

  }

}

