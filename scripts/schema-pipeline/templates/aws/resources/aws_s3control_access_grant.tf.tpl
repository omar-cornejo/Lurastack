# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_s3control_access_grant                          │
# └──────────────────────────────────────────────────────────────┘
resource "aws_s3control_access_grant" "this" {

  access_grants_location_id = ""     # string | required
  permission                = ""     # string | required
  account_id                = ""     # string | optional+computed
  s3_prefix_type            = ""     # string | optional
  tags                      = {}     # map(string) | optional

  # access_grant_arn          = ""     # string | computed
  # access_grant_id           = ""     # string | computed
  # grant_scope               = ""     # string | computed
  # id                        = ""     # string | computed
  # tags_all                  = {}     # map(string) | computed

  access_grants_location_configuration { # list
    s3_sub_prefix = ""     # string | optional

  }

  grantee { # list
    grantee_identifier = ""     # string | required
    grantee_type       = ""     # string | required

  }

}

