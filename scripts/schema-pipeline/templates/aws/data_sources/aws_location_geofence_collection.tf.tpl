# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_location_geofence_collection                        │
# └──────────────────────────────────────────────────────────────┘
data "aws_location_geofence_collection" "this" {

  collection_name = ""     # string | required
  id              = ""     # string | optional+computed
  kms_key_id      = ""     # string | optional+computed
  tags            = {}     # map(string) | optional+computed

  # collection_arn  = ""     # string | computed
  # create_time     = ""     # string | computed
  # description     = ""     # string | computed
  # update_time     = ""     # string | computed

}

