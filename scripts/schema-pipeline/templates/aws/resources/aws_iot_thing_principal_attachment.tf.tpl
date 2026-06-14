# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_iot_thing_principal_attachment                  │
# └──────────────────────────────────────────────────────────────┘
resource "aws_iot_thing_principal_attachment" "this" {

  principal = ""     # string | required
  thing     = ""     # string | required
  id        = ""     # string | optional+computed

}

