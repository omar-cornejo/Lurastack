# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_iam_user_ssh_key                                │
# └──────────────────────────────────────────────────────────────┘
resource "aws_iam_user_ssh_key" "this" {

  encoding          = ""     # string | required
  public_key        = ""     # string | required
  username          = ""     # string | required
  id                = ""     # string | optional+computed
  status            = ""     # string | optional+computed

  # fingerprint       = ""     # string | computed
  # ssh_public_key_id = ""     # string | computed

}

