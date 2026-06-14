# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_iam_user_ssh_key                                    │
# └──────────────────────────────────────────────────────────────┘
data "aws_iam_user_ssh_key" "this" {

  encoding          = ""     # string | required
  ssh_public_key_id = ""     # string | required
  username          = ""     # string | required
  id                = ""     # string | optional+computed

  # fingerprint       = ""     # string | computed
  # public_key        = ""     # string | computed
  # status            = ""     # string | computed

}

