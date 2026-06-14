# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_servicecatalog_launch_paths                         │
# └──────────────────────────────────────────────────────────────┘
data "aws_servicecatalog_launch_paths" "this" {

  product_id      = ""     # string | required
  accept_language = ""     # string | optional
  id              = ""     # string | optional+computed

  # summaries = [  # list(object)
  #   {
  #     constraint_summaries = [  # list(object)
  #       {
  #         description = ""
  #         type = ""
  #       }
  #     ]
  #     name = ""
  #     path_id = ""
  #     tags = {}  # map(string)
  #   }
  # ]

  timeouts { # single
    read = ""     # string | optional

  }

}

