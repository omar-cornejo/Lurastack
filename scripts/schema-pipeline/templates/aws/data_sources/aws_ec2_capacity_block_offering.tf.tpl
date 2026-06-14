# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_ec2_capacity_block_offering                         │
# └──────────────────────────────────────────────────────────────┘
data "aws_ec2_capacity_block_offering" "this" {

  capacity_duration_hours    = 0      # number | required
  instance_count             = 0      # number | required
  instance_type              = ""     # string | required
  end_date_range             = ""     # string | optional+computed
  start_date_range           = ""     # string | optional+computed

  # availability_zone          = ""     # string | computed
  # capacity_block_offering_id = ""     # string | computed
  # currency_code              = ""     # string | computed
  # tenancy                    = ""     # string | computed
  # upfront_fee                = ""     # string | computed

}

