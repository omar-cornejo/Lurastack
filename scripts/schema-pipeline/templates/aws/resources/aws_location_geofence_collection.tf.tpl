# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_location_geofence_collection                    │
# └──────────────────────────────────────────────────────────────┘
resource "aws_location_geofence_collection" "this" {

  collection_name = ""     # string | required
  description     = ""     # string | optional
  id              = ""     # string | optional+computed
  kms_key_id      = ""     # string | optional
  tags            = {}     # map(string) | optional
  tags_all        = {}     # map(string) | optional+computed

  # collection_arn  = ""     # string | computed
  # create_time     = ""     # string | computed
  # update_time     = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

