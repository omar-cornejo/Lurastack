# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_redshift_endpoint_authorization                 │
# └──────────────────────────────────────────────────────────────┘
resource "aws_redshift_endpoint_authorization" "this" {

  account            = ""     # string | required
  cluster_identifier = ""     # string | required
  force_delete       = false  # bool | optional
  id                 = ""     # string | optional+computed
  vpc_ids            = []     # set(string) | optional

  # allowed_all_vpcs   = false  # bool | computed
  # endpoint_count     = 0      # number | computed
  # grantee            = ""     # string | computed
  # grantor            = ""     # string | computed

}

