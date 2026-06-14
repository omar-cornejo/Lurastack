# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_ce_cost_category                                    │
# └──────────────────────────────────────────────────────────────┘
data "aws_ce_cost_category" "this" {

  cost_category_arn = ""     # string | required
  id                = ""     # string | optional+computed
  tags              = {}     # map(string) | optional+computed

  # default_value     = ""     # string | computed
  # effective_end     = ""     # string | computed
  # effective_start   = ""     # string | computed
  # name              = ""     # string | computed
  # rule = [  # set(object)
  #   {
  #     inherited_value = [  # list(object)
  #       {
  #         dimension_key = ""
  #         dimension_name = ""
  #       }
  #     ]
  #     rule = [  # list(object)
  #       {
  #         and = [  # set(object)
  #           {
  #             and = [  # set(object)
  #               {
  #                 cost_category = [  # list(object)
  #                   {
  #                     key = ""
  #                     match_options = []  # set(string)
  #                     values = []  # set(string)
  #                   }
  #                 ]
  #                 dimension = [  # list(object)
  #                   {
  #                     key = ""
  #                     match_options = []  # set(string)
  #                     values = []  # set(string)
  #                   }
  #                 ]
  #                 tags = [  # list(object)
  #                   {
  #                     key = ""
  #                     match_options = []  # set(string)
  #                     values = []  # set(string)
  #                   }
  #                 ]
  #               }
  #             ]
  #             cost_category = [  # list(object)
  #               {
  #                 key = ""
  #                 match_options = []  # set(string)
  #                 values = []  # set(string)
  #               }
  #             ]
  #             dimension = [  # list(object)
  #               {
  #                 key = ""
  #                 match_options = []  # set(string)
  #                 values = []  # set(string)
  #               }
  #             ]
  #             not = [  # list(object)
  #               {
  #                 cost_category = [  # list(object)
  #                   {
  #                     key = ""
  #                     match_options = []  # set(string)
  #                     values = []  # set(string)
  #                   }
  #                 ]
  #                 dimension = [  # list(object)
  #                   {
  #                     key = ""
  #                     match_options = []  # set(string)
  #                     values = []  # set(string)
  #                   }
  #                 ]
  #                 tags = [  # list(object)
  #                   {
  #                     key = ""
  #                     match_options = []  # set(string)
  #                     values = []  # set(string)
  #                   }
  #                 ]
  #               }
  #             ]
  #             or = [  # set(object)
  #               {
  #                 cost_category = [  # list(object)
  #                   {
  #                     key = ""
  #                     match_options = []  # set(string)
  #                     values = []  # set(string)
  #                   }
  #                 ]
  #                 dimension = [  # list(object)
  #                   {
  #                     key = ""
  #                     match_options = []  # set(string)
  #                     values = []  # set(string)
  #                   }
  #                 ]
  #                 tags = [  # list(object)
  #                   {
  #                     key = ""
  #                     match_options = []  # set(string)
  #                     values = []  # set(string)
  #                   }
  #                 ]
  #               }
  #             ]
  #             tags = [  # list(object)
  #               {
  #                 key = ""
  #                 match_options = []  # set(string)
  #                 values = []  # set(string)
  #               }
  #             ]
  #           }
  #         ]
  #         cost_category = [  # list(object)
  #           {
  #             key = ""
  #             match_options = []  # set(string)
  #             values = []  # set(string)
  #           }
  #         ]
  #         dimension = [  # list(object)
  #           {
  #             key = ""
  #             match_options = []  # set(string)
  #             values = []  # set(string)
  #           }
  #         ]
  #         not = [  # list(object)
  #           {
  #             and = [  # set(object)
  #               {
  #                 cost_category = [  # list(object)
  #                   {
  #                     key = ""
  #                     match_options = []  # set(string)
  #                     values = []  # set(string)
  #                   }
  #                 ]
  #                 dimension = [  # list(object)
  #                   {
  #                     key = ""
  #                     match_options = []  # set(string)
  #                     values = []  # set(string)
  #                   }
  #                 ]
  #                 tags = [  # list(object)
  #                   {
  #                     key = ""
  #                     match_options = []  # set(string)
  #                     values = []  # set(string)
  #                   }
  #                 ]
  #               }
  #             ]
  #             cost_category = [  # list(object)
  #               {
  #                 key = ""
  #                 match_options = []  # set(string)
  #                 values = []  # set(string)
  #               }
  #             ]
  #             dimension = [  # list(object)
  #               {
  #                 key = ""
  #                 match_options = []  # set(string)
  #                 values = []  # set(string)
  #               }
  #             ]
  #             not = [  # list(object)
  #               {
  #                 cost_category = [  # list(object)
  #                   {
  #                     key = ""
  #                     match_options = []  # set(string)
  #                     values = []  # set(string)
  #                   }
  #                 ]
  #                 dimension = [  # list(object)
  #                   {
  #                     key = ""
  #                     match_options = []  # set(string)
  #                     values = []  # set(string)
  #                   }
  #                 ]
  #                 tags = [  # list(object)
  #                   {
  #                     key = ""
  #                     match_options = []  # set(string)
  #                     values = []  # set(string)
  #                   }
  #                 ]
  #               }
  #             ]
  #             or = [  # set(object)
  #               {
  #                 cost_category = [  # list(object)
  #                   {
  #                     key = ""
  #                     match_options = []  # set(string)
  #                     values = []  # set(string)
  #                   }
  #                 ]
  #                 dimension = [  # list(object)
  #                   {
  #                     key = ""
  #                     match_options = []  # set(string)
  #                     values = []  # set(string)
  #                   }
  #                 ]
  #                 tags = [  # list(object)
  #                   {
  #                     key = ""
  #                     match_options = []  # set(string)
  #                     values = []  # set(string)
  #                   }
  #                 ]
  #               }
  #             ]
  #             tags = [  # list(object)
  #               {
  #                 key = ""
  #                 match_options = []  # set(string)
  #                 values = []  # set(string)
  #               }
  #             ]
  #           }
  #         ]
  #         or = [  # set(object)
  #           {
  #             and = [  # set(object)
  #               {
  #                 cost_category = [  # list(object)
  #                   {
  #                     key = ""
  #                     match_options = []  # set(string)
  #                     values = []  # set(string)
  #                   }
  #                 ]
  #                 dimension = [  # list(object)
  #                   {
  #                     key = ""
  #                     match_options = []  # set(string)
  #                     values = []  # set(string)
  #                   }
  #                 ]
  #                 tags = [  # list(object)
  #                   {
  #                     key = ""
  #                     match_options = []  # set(string)
  #                     values = []  # set(string)
  #                   }
  #                 ]
  #               }
  #             ]
  #             cost_category = [  # list(object)
  #               {
  #                 key = ""
  #                 match_options = []  # set(string)
  #                 values = []  # set(string)
  #               }
  #             ]
  #             dimension = [  # list(object)
  #               {
  #                 key = ""
  #                 match_options = []  # set(string)
  #                 values = []  # set(string)
  #               }
  #             ]
  #             not = [  # list(object)
  #               {
  #                 cost_category = [  # list(object)
  #                   {
  #                     key = ""
  #                     match_options = []  # set(string)
  #                     values = []  # set(string)
  #                   }
  #                 ]
  #                 dimension = [  # list(object)
  #                   {
  #                     key = ""
  #                     match_options = []  # set(string)
  #                     values = []  # set(string)
  #                   }
  #                 ]
  #                 tags = [  # list(object)
  #                   {
  #                     key = ""
  #                     match_options = []  # set(string)
  #                     values = []  # set(string)
  #                   }
  #                 ]
  #               }
  #             ]
  #             or = [  # set(object)
  #               {
  #                 cost_category = [  # list(object)
  #                   {
  #                     key = ""
  #                     match_options = []  # set(string)
  #                     values = []  # set(string)
  #                   }
  #                 ]
  #                 dimension = [  # list(object)
  #                   {
  #                     key = ""
  #                     match_options = []  # set(string)
  #                     values = []  # set(string)
  #                   }
  #                 ]
  #                 tags = [  # list(object)
  #                   {
  #                     key = ""
  #                     match_options = []  # set(string)
  #                     values = []  # set(string)
  #                   }
  #                 ]
  #               }
  #             ]
  #             tags = [  # list(object)
  #               {
  #                 key = ""
  #                 match_options = []  # set(string)
  #                 values = []  # set(string)
  #               }
  #             ]
  #           }
  #         ]
  #         tags = [  # list(object)
  #           {
  #             key = ""
  #             match_options = []  # set(string)
  #             values = []  # set(string)
  #           }
  #         ]
  #       }
  #     ]
  #     type = ""
  #     value = ""
  #   }
  # ]
  # rule_version      = ""     # string | computed
  # split_charge_rule = [  # set(object)
  #   {
  #     method = ""
  #     parameter = [  # set(object)
  #       {
  #         type = ""
  #         values = []  # set(string)
  #       }
  #     ]
  #     source = ""
  #     targets = []  # set(string)
  #   }
  # ]

}

