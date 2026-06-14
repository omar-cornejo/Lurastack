# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_opensearch_inbound_connection_accepter          │
# └──────────────────────────────────────────────────────────────┘
resource "aws_opensearch_inbound_connection_accepter" "this" {

  connection_id     = ""     # string | required
  id                = ""     # string | optional+computed

  # connection_status = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

