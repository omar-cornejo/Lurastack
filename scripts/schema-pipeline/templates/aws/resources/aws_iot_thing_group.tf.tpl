# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_iot_thing_group                                 │
# └──────────────────────────────────────────────────────────────┘
resource "aws_iot_thing_group" "this" {

  name              = ""     # string | required
  id                = ""     # string | optional+computed
  parent_group_name = ""     # string | optional
  tags              = {}     # map(string) | optional
  tags_all          = {}     # map(string) | optional+computed

  # arn               = ""     # string | computed
  # metadata = [  # list(object)
  #   {
  #     creation_date = ""
  #     parent_group_name = ""
  #     root_to_parent_groups = [  # list(object)
  #       {
  #         group_arn = ""
  #         group_name = ""
  #       }
  #     ]
  #   }
  # ]
  # version           = 0      # number | computed

  properties { # list [0..1]
    description = ""     # string | optional

    attribute_payload { # list [0..1]
      attributes = {}     # map(string) | optional

    }

  }

}

