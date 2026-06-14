# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_datapipeline_pipeline_definition                    │
# └──────────────────────────────────────────────────────────────┘
data "aws_datapipeline_pipeline_definition" "this" {

  pipeline_id      = ""     # string | required
  id               = ""     # string | optional+computed

  # parameter_object = [  # set(object)
  #   {
  #     attribute = [  # set(object)
  #       {
  #         key = ""
  #         string_value = ""
  #       }
  #     ]
  #     id = ""
  #   }
  # ]
  # pipeline_object = [  # set(object)
  #   {
  #     field = [  # set(object)
  #       {
  #         key = ""
  #         ref_value = ""
  #         string_value = ""
  #       }
  #     ]
  #     id = ""
  #     name = ""
  #   }
  # ]

  parameter_value { # set

    # id           = ""     # string | computed
    # string_value = ""     # string | computed

  }

}

