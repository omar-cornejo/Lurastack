# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_s3control_access_grants_instance                │
# └──────────────────────────────────────────────────────────────┘
resource "aws_s3control_access_grants_instance" "this" {

  account_id                      = ""     # string | optional+computed
  identity_center_arn             = ""     # string | optional
  tags                            = {}     # map(string) | optional

  # access_grants_instance_arn      = ""     # string | computed
  # access_grants_instance_id       = ""     # string | computed
  # id                              = ""     # string | computed
  # identity_center_application_arn = ""     # string | computed
  # tags_all                        = {}     # map(string) | computed

}

