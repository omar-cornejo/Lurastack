# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_ec2_serial_console_access                           │
# └──────────────────────────────────────────────────────────────┘
data "aws_ec2_serial_console_access" "this" {

  id      = ""     # string | optional+computed

  # enabled = false  # bool | computed

  timeouts { # single
    read = ""     # string | optional

  }

}

