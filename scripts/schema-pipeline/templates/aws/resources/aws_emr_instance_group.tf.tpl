# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_emr_instance_group                              │
# └──────────────────────────────────────────────────────────────┘
resource "aws_emr_instance_group" "this" {

  cluster_id             = ""     # string | required
  instance_type          = ""     # string | required
  autoscaling_policy     = ""     # string | optional
  bid_price              = ""     # string | optional
  configurations_json    = ""     # string | optional
  ebs_optimized          = false  # bool | optional
  id                     = ""     # string | optional+computed
  instance_count         = 0      # number | optional+computed
  name                   = ""     # string | optional

  # running_instance_count = 0      # number | computed
  # status                 = ""     # string | computed

  ebs_config { # set
    size                 = 0      # number | required
    type                 = ""     # string | required
    iops                 = 0      # number | optional
    volumes_per_instance = 0      # number | optional

  }

}

