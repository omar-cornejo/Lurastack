# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_network_interface_attachment                    │
# └──────────────────────────────────────────────────────────────┘
resource "aws_network_interface_attachment" "this" {

  device_index         = 0      # number | required
  instance_id          = ""     # string | required
  network_interface_id = ""     # string | required
  id                   = ""     # string | optional+computed

  # attachment_id        = ""     # string | computed
  # status               = ""     # string | computed

}

