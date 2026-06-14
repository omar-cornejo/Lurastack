# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_connect_user_hierarchy_group                    │
# └──────────────────────────────────────────────────────────────┘
resource "aws_connect_user_hierarchy_group" "this" {

  instance_id        = ""     # string | required
  name               = ""     # string | required
  id                 = ""     # string | optional+computed
  parent_group_id    = ""     # string | optional
  tags               = {}     # map(string) | optional
  tags_all           = {}     # map(string) | optional+computed

  # arn                = ""     # string | computed
  # hierarchy_group_id = ""     # string | computed
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

