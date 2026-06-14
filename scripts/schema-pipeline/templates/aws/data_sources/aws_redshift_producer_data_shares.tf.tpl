# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_redshift_producer_data_shares                       │
# └──────────────────────────────────────────────────────────────┘
data "aws_redshift_producer_data_shares" "this" {

  producer_arn = ""     # string | required
  status       = ""     # string | optional

  # id           = ""     # string | computed

  data_shares { # list

    # data_share_arn = ""     # string | computed
    # managed_by     = ""     # string | computed
    # producer_arn   = ""     # string | computed

  }

}

