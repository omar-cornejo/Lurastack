# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_volume_attachment                               │
# └──────────────────────────────────────────────────────────────┘
resource "aws_volume_attachment" "this" {

  device_name                    = ""     # string | required
  instance_id                    = ""     # string | required
  volume_id                      = ""     # string | required
  force_detach                   = false  # bool | optional
  id                             = ""     # string | optional+computed
  skip_destroy                   = false  # bool | optional
  stop_instance_before_detaching = false  # bool | optional

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

