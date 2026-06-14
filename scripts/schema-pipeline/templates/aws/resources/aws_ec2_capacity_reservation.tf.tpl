# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ec2_capacity_reservation                        │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ec2_capacity_reservation" "this" {

  availability_zone       = ""     # string | required
  instance_count          = 0      # number | required
  instance_platform       = ""     # string | required
  instance_type           = ""     # string | required
  ebs_optimized           = false  # bool | optional
  end_date                = ""     # string | optional
  end_date_type           = ""     # string | optional
  ephemeral_storage       = false  # bool | optional
  id                      = ""     # string | optional+computed
  instance_match_criteria = ""     # string | optional
  outpost_arn             = ""     # string | optional
  placement_group_arn     = ""     # string | optional
  tags                    = {}     # map(string) | optional
  tags_all                = {}     # map(string) | optional+computed
  tenancy                 = ""     # string | optional

  # arn                     = ""     # string | computed
  # owner_id                = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

