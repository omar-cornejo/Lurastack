# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_finspace_kx_volume                              │
# └──────────────────────────────────────────────────────────────┘
resource "aws_finspace_kx_volume" "this" {

  availability_zones      = []     # list(string) | required
  az_mode                 = ""     # string | required
  environment_id          = ""     # string | required
  name                    = ""     # string | required
  type                    = ""     # string | required
  description             = ""     # string | optional
  id                      = ""     # string | optional+computed
  tags                    = {}     # map(string) | optional
  tags_all                = {}     # map(string) | optional+computed

  # arn                     = ""     # string | computed
  # attached_clusters = [  # list(object)
  #   {
  #     cluster_name = ""
  #     cluster_status = ""
  #     cluster_type = ""
  #   }
  # ]
  # created_timestamp       = ""     # string | computed
  # last_modified_timestamp = ""     # string | computed
  # status                  = ""     # string | computed
  # status_reason           = ""     # string | computed

  nas1_configuration { # list
    size = 0      # number | required
    type = ""     # string | required

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

