# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_elastictranscoder_preset                        │
# └──────────────────────────────────────────────────────────────┘
resource "aws_elastictranscoder_preset" "this" {

  container           = ""     # string | required
  description         = ""     # string | optional
  id                  = ""     # string | optional+computed
  name                = ""     # string | optional+computed
  type                = ""     # string | optional+computed
  video_codec_options = {}     # map(string) | optional

  # arn                 = ""     # string | computed

  audio { # list [0..1]
    audio_packing_mode = ""     # string | optional
    bit_rate           = ""     # string | optional+computed
    channels           = ""     # string | optional
    codec              = ""     # string | optional
    sample_rate        = ""     # string | optional

  }

  audio_codec_options { # list [0..1]
    bit_depth = ""     # string | optional+computed
    bit_order = ""     # string | optional+computed
    profile   = ""     # string | optional+computed
    signed    = ""     # string | optional+computed

  }

  thumbnails { # list [0..1]
    aspect_ratio   = ""     # string | optional
    format         = ""     # string | optional
    interval       = ""     # string | optional
    max_height     = ""     # string | optional
    max_width      = ""     # string | optional
    padding_policy = ""     # string | optional
    resolution     = ""     # string | optional
    sizing_policy  = ""     # string | optional

  }

  video { # list [0..1]
    aspect_ratio         = ""     # string | optional
    bit_rate             = ""     # string | optional+computed
    codec                = ""     # string | optional
    display_aspect_ratio = ""     # string | optional
    fixed_gop            = ""     # string | optional
    frame_rate           = ""     # string | optional
    keyframes_max_dist   = ""     # string | optional
    max_frame_rate       = ""     # string | optional+computed
    max_height           = ""     # string | optional
    max_width            = ""     # string | optional
    padding_policy       = ""     # string | optional
    resolution           = ""     # string | optional
    sizing_policy        = ""     # string | optional

  }

  video_watermarks { # set
    horizontal_align  = ""     # string | optional
    horizontal_offset = ""     # string | optional
    id                = ""     # string | optional
    max_height        = ""     # string | optional
    max_width         = ""     # string | optional
    opacity           = ""     # string | optional
    sizing_policy     = ""     # string | optional
    target            = ""     # string | optional
    vertical_align    = ""     # string | optional
    vertical_offset   = ""     # string | optional

  }

}

