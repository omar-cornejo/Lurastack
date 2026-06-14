# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ec2_image_block_public_access                   │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ec2_image_block_public_access" "this" {

  state = ""     # string | required
  id    = ""     # string | optional+computed

  timeouts { # single
    update = ""     # string | optional

  }

}

