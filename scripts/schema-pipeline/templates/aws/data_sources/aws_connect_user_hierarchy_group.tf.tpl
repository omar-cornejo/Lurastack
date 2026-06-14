# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_connect_user_hierarchy_group                        │
# └──────────────────────────────────────────────────────────────┘
data "aws_connect_user_hierarchy_group" "this" {

  instance_id        = ""     # string | required
  hierarchy_group_id = ""     # string | optional+computed
  id                 = ""     # string | optional+computed
  name               = ""     # string | optional+computed
  tags               = {}     # map(string) | optional+computed

  # arn                = ""     # string | computed
  # hierarchy_path = [  # list(object)
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
  # level_id           = ""     # string | computed

}

