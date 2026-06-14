# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_iam_access_keys                                     │
# └──────────────────────────────────────────────────────────────┘
data "aws_iam_access_keys" "this" {

  user        = ""     # string | required
  id          = ""     # string | optional+computed

  # access_keys = [  # set(object)
  #   {
  #     access_key_id = ""
  #     create_date = ""
  #     status = ""
  #   }
  # ]

}

