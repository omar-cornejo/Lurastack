# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_quicksight_theme                                │
# └──────────────────────────────────────────────────────────────┘
resource "aws_quicksight_theme" "this" {

  base_theme_id       = ""     # string | required
  name                = ""     # string | required
  theme_id            = ""     # string | required
  aws_account_id      = ""     # string | optional+computed
  id                  = ""     # string | optional+computed
  tags                = {}     # map(string) | optional
  tags_all            = {}     # map(string) | optional+computed
  version_description = ""     # string | optional

  # arn                 = ""     # string | computed
  # created_time        = ""     # string | computed
  # last_updated_time   = ""     # string | computed
  # status              = ""     # string | computed
  # version_number      = 0      # number | computed

  configuration { # list [0..1]

    data_color_palette { # list [0..1]
      colors           = []     # list(string) | optional
      empty_fill_color = ""     # string | optional
      min_max_gradient = []     # list(string) | optional

    }

    sheet { # list [0..1]

      tile { # list [0..1]

        border { # list [0..1]
          show = false  # bool | optional

        }

      }

      tile_layout { # list [0..1]

        gutter { # list [0..1]
          show = false  # bool | optional

        }

        margin { # list [0..1]
          show = false  # bool | optional

        }

      }

    }

    typography { # list [0..1]

      font_families { # list [0..5]
        font_family = ""     # string | optional

      }

    }

    ui_color_palette { # list [0..1]
      accent               = ""     # string | optional
      accent_foreground    = ""     # string | optional
      danger               = ""     # string | optional
      danger_foreground    = ""     # string | optional
      dimension            = ""     # string | optional
      dimension_foreground = ""     # string | optional
      measure              = ""     # string | optional
      measure_foreground   = ""     # string | optional
      primary_background   = ""     # string | optional
      primary_foreground   = ""     # string | optional
      secondary_background = ""     # string | optional
      secondary_foreground = ""     # string | optional
      success              = ""     # string | optional
      success_foreground   = ""     # string | optional
      warning              = ""     # string | optional
      warning_foreground   = ""     # string | optional

    }

  }

  permissions { # set [0..64]
    actions   = []     # set(string) | required
    principal = ""     # string | required

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

