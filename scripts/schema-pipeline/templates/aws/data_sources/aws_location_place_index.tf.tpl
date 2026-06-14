# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_location_place_index                                │
# └──────────────────────────────────────────────────────────────┘
data "aws_location_place_index" "this" {

  index_name                = ""     # string | required
  id                        = ""     # string | optional+computed
  tags                      = {}     # map(string) | optional+computed

  # create_time               = ""     # string | computed
  # data_source               = ""     # string | computed
  # data_source_configuration = [  # list(object)
  #   {
  #     intended_use = ""
  #   }
  # ]
  # description               = ""     # string | computed
  # index_arn                 = ""     # string | computed
  # update_time               = ""     # string | computed

}

