# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_lambda_function_url                                 │
# └──────────────────────────────────────────────────────────────┘
data "aws_lambda_function_url" "this" {

  function_name      = ""     # string | required
  id                 = ""     # string | optional+computed
  qualifier          = ""     # string | optional

  # authorization_type = ""     # string | computed
  # cors = [  # list(object)
  #   {
  #     allow_credentials = false
  #     allow_headers = []  # list(string)
  #     allow_methods = []  # list(string)
  #     allow_origins = []  # list(string)
  #     expose_headers = []  # list(string)
  #     max_age = 0
  #   }
  # ]
  # creation_time      = ""     # string | computed
  # function_arn       = ""     # string | computed
  # function_url       = ""     # string | computed
  # invoke_mode        = ""     # string | computed
  # last_modified_time = ""     # string | computed
  # url_id             = ""     # string | computed

}

