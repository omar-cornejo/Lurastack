# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_api_gateway_api_keys                                │
# └──────────────────────────────────────────────────────────────┘
data "aws_api_gateway_api_keys" "this" {

  customer_id    = ""     # string | optional
  include_values = false  # bool | optional

  # id             = ""     # string | computed
  # items = [  # list(object)
  #   {
  #     created_date = ""
  #     customer_id = ""
  #     description = ""
  #     enabled = false
  #     id = ""
  #     last_updated_date = ""
  #     name = ""
  #     stage_keys = []  # list(string)
  #     tags = {}  # map(string)
  #     value = ""
  #   }
  # ]

}

