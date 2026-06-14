# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_medialive_multiplex_program                     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_medialive_multiplex_program" "this" {

  multiplex_id = ""     # string | required
  program_name = ""     # string | required

  # id           = ""     # string | computed

  multiplex_program_settings { # list
    preferred_channel_pipeline = ""     # string | required
    program_number             = 0      # number | required

    service_descriptor { # list
      provider_name = ""     # string | required
      service_name  = ""     # string | required

    }

    video_settings { # list
      constant_bitrate = 0      # number | optional+computed

      statmux_settings { # list
        maximum_bitrate = 0      # number | optional+computed
        minimum_bitrate = 0      # number | optional+computed
        priority        = 0      # number | optional+computed

      }

    }

  }

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}

