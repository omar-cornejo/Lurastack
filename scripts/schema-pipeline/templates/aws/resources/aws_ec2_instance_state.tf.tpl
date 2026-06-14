# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ec2_instance_state                              │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ec2_instance_state" "this" {

  instance_id = ""     # string | required
  state       = ""     # string | required
  force       = false  # bool | optional
  id          = ""     # string | optional+computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

