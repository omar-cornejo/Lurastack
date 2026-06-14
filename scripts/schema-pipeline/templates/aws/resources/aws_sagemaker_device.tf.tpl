# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_sagemaker_device                                │
# └──────────────────────────────────────────────────────────────┘
resource "aws_sagemaker_device" "this" {

  device_fleet_name = ""     # string | required
  id                = ""     # string | optional+computed

  # agent_version     = ""     # string | computed
  # arn               = ""     # string | computed

  device { # list [1..1]
    device_name    = ""     # string | required
    description    = ""     # string | optional
    iot_thing_name = ""     # string | optional

  }

}

