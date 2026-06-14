# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ec2_serial_console_access                       │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ec2_serial_console_access" "this" {

  enabled = false  # bool | optional
  id      = ""     # string | optional+computed

}

