# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_redshift_data_share_consumer_association        │
# └──────────────────────────────────────────────────────────────┘
resource "aws_redshift_data_share_consumer_association" "this" {

  data_share_arn           = ""     # string | required
  allow_writes             = false  # bool | optional
  associate_entire_account = false  # bool | optional
  consumer_arn             = ""     # string | optional
  consumer_region          = ""     # string | optional

  # id                       = ""     # string | computed
  # managed_by               = ""     # string | computed
  # producer_arn             = ""     # string | computed

}

