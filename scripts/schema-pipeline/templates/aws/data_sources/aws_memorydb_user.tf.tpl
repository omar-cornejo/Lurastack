# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_memorydb_user                                       │
# └──────────────────────────────────────────────────────────────┘
data "aws_memorydb_user" "this" {

  user_name              = ""     # string | required
  id                     = ""     # string | optional+computed
  tags                   = {}     # map(string) | optional+computed

  # access_string          = ""     # string | computed
  # arn                    = ""     # string | computed
  # authentication_mode = [  # list(object)
  #   {
  #     password_count = 0
  #     type = ""
  #   }
  # ]
  # minimum_engine_version = ""     # string | computed

}

