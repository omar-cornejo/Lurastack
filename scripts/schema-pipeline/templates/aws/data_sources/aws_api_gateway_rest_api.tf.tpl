# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_api_gateway_rest_api                                │
# └──────────────────────────────────────────────────────────────┘
data "aws_api_gateway_rest_api" "this" {

  name                     = ""     # string | required
  id                       = ""     # string | optional+computed
  tags                     = {}     # map(string) | optional+computed

  # api_key_source           = ""     # string | computed
  # arn                      = ""     # string | computed
  # binary_media_types       = []     # list(string) | computed
  # description              = ""     # string | computed
  # endpoint_configuration = [  # list(object)
  #   {
  #     ip_address_type = ""
  #     types = []  # list(string)
  #     vpc_endpoint_ids = []  # set(string)
  #   }
  # ]
  # execution_arn            = ""     # string | computed
  # minimum_compression_size = ""     # string | computed
  # policy                   = ""     # string | computed
  # root_resource_id         = ""     # string | computed

}

