# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_kinesisanalyticsv2_application_snapshot         │
# └──────────────────────────────────────────────────────────────┘
resource "aws_kinesisanalyticsv2_application_snapshot" "this" {

  application_name            = ""     # string | required
  snapshot_name               = ""     # string | required
  id                          = ""     # string | optional+computed

  # application_version_id      = 0      # number | computed
  # snapshot_creation_timestamp = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

