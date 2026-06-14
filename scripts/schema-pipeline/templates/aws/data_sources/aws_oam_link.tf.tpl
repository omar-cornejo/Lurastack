# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_oam_link                                            │
# └──────────────────────────────────────────────────────────────┘
data "aws_oam_link" "this" {

  link_identifier    = ""     # string | required
  id                 = ""     # string | optional+computed
  tags               = {}     # map(string) | optional+computed

  # arn                = ""     # string | computed
  # label              = ""     # string | computed
  # label_template     = ""     # string | computed
  # link_configuration = [  # list(object)
  #   {
  #     log_group_configuration = [  # list(object)
  #       {
  #         filter = ""
  #       }
  #     ]
  #     metric_configuration = [  # list(object)
  #       {
  #         filter = ""
  #       }
  #     ]
  #   }
  # ]
  # link_id            = ""     # string | computed
  # resource_types     = []     # set(string) | computed
  # sink_arn           = ""     # string | computed

}

