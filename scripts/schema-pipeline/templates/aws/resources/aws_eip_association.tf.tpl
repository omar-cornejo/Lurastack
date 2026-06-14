# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_eip_association                                 │
# └──────────────────────────────────────────────────────────────┘
resource "aws_eip_association" "this" {

  allocation_id        = ""     # string | optional+computed
  allow_reassociation  = false  # bool | optional
  id                   = ""     # string | optional+computed
  instance_id          = ""     # string | optional+computed
  network_interface_id = ""     # string | optional+computed
  private_ip_address   = ""     # string | optional+computed
  public_ip            = ""     # string | optional+computed

}

