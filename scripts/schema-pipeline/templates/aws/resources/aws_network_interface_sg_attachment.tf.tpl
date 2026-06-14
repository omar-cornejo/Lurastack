# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_network_interface_sg_attachment                 │
# └──────────────────────────────────────────────────────────────┘
resource "aws_network_interface_sg_attachment" "this" {

  network_interface_id = ""     # string | required
  security_group_id    = ""     # string | required
  id                   = ""     # string | optional+computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    read   = ""     # string | optional

  }

}

