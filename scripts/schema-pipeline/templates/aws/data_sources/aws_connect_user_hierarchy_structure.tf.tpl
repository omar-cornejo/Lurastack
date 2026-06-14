# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_connect_user_hierarchy_structure                    │
# └──────────────────────────────────────────────────────────────┘
data "aws_connect_user_hierarchy_structure" "this" {

  instance_id         = ""     # string | required
  id                  = ""     # string | optional+computed

  # hierarchy_structure = [  # list(object)
  #   {
  #     level_five = [  # list(object)
  #       {
  #         arn = ""
  #         id = ""
  #         name = ""
  #       }
  #     ]
  #     level_four = [  # list(object)
  #       {
  #         arn = ""
  #         id = ""
  #         name = ""
  #       }
  #     ]
  #     level_one = [  # list(object)
  #       {
  #         arn = ""
  #         id = ""
  #         name = ""
  #       }
  #     ]
  #     level_three = [  # list(object)
  #       {
  #         arn = ""
  #         id = ""
  #         name = ""
  #       }
  #     ]
  #     level_two = [  # list(object)
  #       {
  #         arn = ""
  #         id = ""
  #         name = ""
  #       }
  #     ]
  #   }
  # ]

}

