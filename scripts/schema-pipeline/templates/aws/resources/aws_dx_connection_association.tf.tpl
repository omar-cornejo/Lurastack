# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_dx_connection_association                       │
# └──────────────────────────────────────────────────────────────┘
resource "aws_dx_connection_association" "this" {

  connection_id = ""     # string | required
  lag_id        = ""     # string | required
  id            = ""     # string | optional+computed

}

