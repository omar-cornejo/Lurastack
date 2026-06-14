# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_transfer_ssh_key                                │
# └──────────────────────────────────────────────────────────────┘
resource "aws_transfer_ssh_key" "this" {

  body       = ""     # string | required
  server_id  = ""     # string | required
  user_name  = ""     # string | required
  id         = ""     # string | optional+computed

  # ssh_key_id = ""     # string | computed

}

