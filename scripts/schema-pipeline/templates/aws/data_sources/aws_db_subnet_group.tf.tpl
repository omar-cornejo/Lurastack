# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_db_subnet_group                                     │
# └──────────────────────────────────────────────────────────────┘
data "aws_db_subnet_group" "this" {

  name                    = ""     # string | required
  id                      = ""     # string | optional+computed

  # arn                     = ""     # string | computed
  # description             = ""     # string | computed
  # status                  = ""     # string | computed
  # subnet_ids              = []     # set(string) | computed
  # supported_network_types = []     # set(string) | computed
  # vpc_id                  = ""     # string | computed

}

