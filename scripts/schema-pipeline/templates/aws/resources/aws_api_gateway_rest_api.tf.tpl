# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_api_gateway_rest_api                            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_api_gateway_rest_api" "this" {

  name                         = ""     # string | required
  api_key_source               = ""     # string | optional+computed
  binary_media_types           = []     # list(string) | optional+computed
  body                         = ""     # string | optional
  description                  = ""     # string | optional+computed
  disable_execute_api_endpoint = false  # bool | optional+computed
  fail_on_warnings             = false  # bool | optional
  id                           = ""     # string | optional+computed
  minimum_compression_size     = ""     # string | optional+computed
  parameters                   = {}     # map(string) | optional
  policy                       = ""     # string | optional+computed
  put_rest_api_mode            = ""     # string | optional
  tags                         = {}     # map(string) | optional
  tags_all                     = {}     # map(string) | optional+computed

  # arn                          = ""     # string | computed
  # created_date                 = ""     # string | computed
  # execution_arn                = ""     # string | computed
  # root_resource_id             = ""     # string | computed

  endpoint_configuration { # list [0..1]
    types            = []     # list(string) | required
    ip_address_type  = ""     # string | optional+computed
    vpc_endpoint_ids = []     # set(string) | optional+computed

  }

}

