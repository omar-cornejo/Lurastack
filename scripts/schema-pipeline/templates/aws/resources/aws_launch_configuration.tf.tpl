# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_launch_configuration                            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_launch_configuration" "this" {

  image_id                    = ""     # string | required
  instance_type               = ""     # string | required
  associate_public_ip_address = false  # bool | optional+computed
  ebs_optimized               = false  # bool | optional+computed
  enable_monitoring           = false  # bool | optional
  iam_instance_profile        = ""     # string | optional
  id                          = ""     # string | optional+computed
  key_name                    = ""     # string | optional+computed
  name                        = ""     # string | optional+computed
  name_prefix                 = ""     # string | optional+computed
  placement_tenancy           = ""     # string | optional
  security_groups             = []     # set(string) | optional
  spot_price                  = ""     # string | optional
  user_data                   = ""     # string | optional
  user_data_base64            = ""     # string | optional

  # arn                         = ""     # string | computed

  ebs_block_device { # set
    device_name           = ""     # string | required
    delete_on_termination = false  # bool | optional
    encrypted             = false  # bool | optional+computed
    iops                  = 0      # number | optional+computed
    no_device             = false  # bool | optional
    snapshot_id           = ""     # string | optional+computed
    throughput            = 0      # number | optional+computed
    volume_size           = 0      # number | optional+computed
    volume_type           = ""     # string | optional+computed

  }

  ephemeral_block_device { # set
    device_name  = ""     # string | required
    no_device    = false  # bool | optional
    virtual_name = ""     # string | optional

  }

  metadata_options { # list [0..1]
    http_endpoint               = ""     # string | optional+computed
    http_put_response_hop_limit = 0      # number | optional+computed
    http_tokens                 = ""     # string | optional+computed

  }

  root_block_device { # list [0..1]
    delete_on_termination = false  # bool | optional
    encrypted             = false  # bool | optional+computed
    iops                  = 0      # number | optional+computed
    throughput            = 0      # number | optional+computed
    volume_size           = 0      # number | optional+computed
    volume_type           = ""     # string | optional+computed

  }

}

