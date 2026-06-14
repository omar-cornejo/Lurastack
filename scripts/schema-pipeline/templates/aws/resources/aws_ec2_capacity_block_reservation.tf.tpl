# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ec2_capacity_block_reservation                  │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ec2_capacity_block_reservation" "this" {

  capacity_block_offering_id = ""     # string | required
  instance_platform          = ""     # string | required
  tags                       = {}     # map(string) | optional

  # arn                        = ""     # string | computed
  # availability_zone          = ""     # string | computed
  # created_date               = ""     # string | computed
  # ebs_optimized              = false  # bool | computed
  # end_date                   = ""     # string | computed
  # end_date_type              = ""     # string | computed
  # id                         = ""     # string | computed
  # instance_count             = 0      # number | computed
  # instance_type              = ""     # string | computed
  # outpost_arn                = ""     # string | computed
  # placement_group_arn        = ""     # string | computed
  # reservation_type           = ""     # string | computed
  # start_date                 = ""     # string | computed
  # tags_all                   = {}     # map(string) | computed
  # tenancy                    = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}

