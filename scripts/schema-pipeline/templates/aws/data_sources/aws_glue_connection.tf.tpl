# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_glue_connection                                     │
# └──────────────────────────────────────────────────────────────┘
data "aws_glue_connection" "this" {

  id                               = ""     # string | required
  tags                             = {}     # map(string) | optional+computed

  # arn                              = ""     # string | computed
  # athena_properties                = {}     # map(string) | computed+sensitive
  # catalog_id                       = ""     # string | computed
  # connection_properties            = {}     # map(string) | computed+sensitive
  # connection_type                  = ""     # string | computed
  # description                      = ""     # string | computed
  # match_criteria                   = []     # list(string) | computed
  # name                             = ""     # string | computed
  # physical_connection_requirements = [  # list(object)
  #   {
  #     availability_zone = ""
  #     security_group_id_list = []  # set(string)
  #     subnet_id = ""
  #   }
  # ]

}

