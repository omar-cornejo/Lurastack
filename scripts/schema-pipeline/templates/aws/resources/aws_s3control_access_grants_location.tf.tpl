# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_s3control_access_grants_location                │
# └──────────────────────────────────────────────────────────────┘
resource "aws_s3control_access_grants_location" "this" {

  iam_role_arn               = ""     # string | required
  location_scope             = ""     # string | required
  account_id                 = ""     # string | optional+computed
  tags                       = {}     # map(string) | optional

  # access_grants_location_arn = ""     # string | computed
  # access_grants_location_id  = ""     # string | computed
  # id                         = ""     # string | computed
  # tags_all                   = {}     # map(string) | computed

}

