# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_dx_connection_confirmation                      │
# └──────────────────────────────────────────────────────────────┘
resource "aws_dx_connection_confirmation" "this" {

  connection_id = ""     # string | required
  id            = ""     # string | optional+computed

}

