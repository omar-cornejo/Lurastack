# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_redshift_data_share_authorization               │
# └──────────────────────────────────────────────────────────────┘
resource "aws_redshift_data_share_authorization" "this" {

  consumer_identifier = ""     # string | required
  data_share_arn      = ""     # string | required
  allow_writes        = false  # bool | optional

  # id                  = ""     # string | computed
  # managed_by          = ""     # string | computed
  # producer_arn        = ""     # string | computed

}

