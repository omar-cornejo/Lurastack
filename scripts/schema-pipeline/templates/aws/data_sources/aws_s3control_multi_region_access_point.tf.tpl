# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_s3control_multi_region_access_point                 │
# └──────────────────────────────────────────────────────────────┘
data "aws_s3control_multi_region_access_point" "this" {

  name                = ""     # string | required
  account_id          = ""     # string | optional+computed
  id                  = ""     # string | optional+computed

  # alias               = ""     # string | computed
  # arn                 = ""     # string | computed
  # created_at          = ""     # string | computed
  # domain_name         = ""     # string | computed
  # public_access_block = [  # list(object)
  #   {
  #     block_public_acls = false
  #     block_public_policy = false
  #     ignore_public_acls = false
  #     restrict_public_buckets = false
  #   }
  # ]
  # regions = [  # list(object)
  #   {
  #     bucket = ""
  #     bucket_account_id = ""
  #     region = ""
  #   }
  # ]
  # status              = ""     # string | computed

}

