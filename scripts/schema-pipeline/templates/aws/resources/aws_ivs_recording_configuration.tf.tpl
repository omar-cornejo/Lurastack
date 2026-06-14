# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ivs_recording_configuration                     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ivs_recording_configuration" "this" {

  id                                 = ""     # string | optional+computed
  name                               = ""     # string | optional+computed
  recording_reconnect_window_seconds = 0      # number | optional+computed
  tags                               = {}     # map(string) | optional
  tags_all                           = {}     # map(string) | optional+computed

  # arn                                = ""     # string | computed
  # state                              = ""     # string | computed

  destination_configuration { # list [1..1]

    s3 { # list [1..1]
      bucket_name = ""     # string | required

    }

  }

  thumbnail_configuration { # list [0..1]
    recording_mode          = ""     # string | optional+computed
    target_interval_seconds = 0      # number | optional+computed

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

