# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_finspace_kx_dataview                            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_finspace_kx_dataview" "this" {

  auto_update             = false  # bool | required
  az_mode                 = ""     # string | required
  database_name           = ""     # string | required
  environment_id          = ""     # string | required
  name                    = ""     # string | required
  availability_zone_id    = ""     # string | optional
  changeset_id            = ""     # string | optional
  description             = ""     # string | optional
  id                      = ""     # string | optional+computed
  read_write              = false  # bool | optional
  tags                    = {}     # map(string) | optional
  tags_all                = {}     # map(string) | optional+computed

  # arn                     = ""     # string | computed
  # created_timestamp       = ""     # string | computed
  # last_modified_timestamp = ""     # string | computed
  # status                  = ""     # string | computed

  segment_configurations { # list
    db_paths    = []     # list(string) | required
    volume_name = ""     # string | required
    on_demand   = false  # bool | optional

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

