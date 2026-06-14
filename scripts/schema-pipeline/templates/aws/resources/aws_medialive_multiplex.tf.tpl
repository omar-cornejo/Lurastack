# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_medialive_multiplex                             │
# └──────────────────────────────────────────────────────────────┘
resource "aws_medialive_multiplex" "this" {

  availability_zones = []     # list(string) | required
  name               = ""     # string | required
  id                 = ""     # string | optional+computed
  start_multiplex    = false  # bool | optional
  tags               = {}     # map(string) | optional
  tags_all           = {}     # map(string) | optional+computed

  # arn                = ""     # string | computed

  multiplex_settings { # list [0..1]
    transport_stream_bitrate                = 0      # number | required
    transport_stream_id                     = 0      # number | required
    maximum_video_buffer_delay_milliseconds = 0      # number | optional+computed
    transport_stream_reserved_bitrate       = 0      # number | optional+computed

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

