# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_quicksight_theme                                    │
# └──────────────────────────────────────────────────────────────┘
data "aws_quicksight_theme" "this" {

  theme_id            = ""     # string | required
  aws_account_id      = ""     # string | optional+computed
  id                  = ""     # string | optional+computed
  tags                = {}     # map(string) | optional+computed

  # arn                 = ""     # string | computed
  # base_theme_id       = ""     # string | computed
  # configuration = [  # list(object)
  #   {
  #     data_color_palette = [  # list(object)
  #       {
  #         colors = []  # list(string)
  #         empty_fill_color = ""
  #         min_max_gradient = []  # list(string)
  #       }
  #     ]
  #     sheet = [  # list(object)
  #       {
  #         tile = [  # list(object)
  #           {
  #             border = [  # list(object)
  #               {
  #                 show = false
  #               }
  #             ]
  #           }
  #         ]
  #         tile_layout = [  # list(object)
  #           {
  #             gutter = [  # list(object)
  #               {
  #                 show = false
  #               }
  #             ]
  #             margin = [  # list(object)
  #               {
  #                 show = false
  #               }
  #             ]
  #           }
  #         ]
  #       }
  #     ]
  #     typography = [  # list(object)
  #       {
  #         font_families = [  # list(object)
  #           {
  #             font_family = ""
  #           }
  #         ]
  #       }
  #     ]
  #     ui_color_palette = [  # list(object)
  #       {
  #         accent = ""
  #         accent_foreground = ""
  #         danger = ""
  #         danger_foreground = ""
  #         dimension = ""
  #         dimension_foreground = ""
  #         measure = ""
  #         measure_foreground = ""
  #         primary_background = ""
  #         primary_foreground = ""
  #         secondary_background = ""
  #         secondary_foreground = ""
  #         success = ""
  #         success_foreground = ""
  #         warning = ""
  #         warning_foreground = ""
  #       }
  #     ]
  #   }
  # ]
  # created_time        = ""     # string | computed
  # last_updated_time   = ""     # string | computed
  # name                = ""     # string | computed
  # permissions = [  # list(object)
  #   {
  #     actions = []  # set(string)
  #     principal = ""
  #   }
  # ]
  # status              = ""     # string | computed
  # version_description = ""     # string | computed
  # version_number      = 0      # number | computed

}

