# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_licensemanager_grant_accepter                   │
# └──────────────────────────────────────────────────────────────┘
resource "aws_licensemanager_grant_accepter" "this" {

  grant_arn          = ""     # string | required | Amazon Resource Name (ARN) of the grant.
  id                 = ""     # string | optional+computed

  # allowed_operations = []     # set(string) | computed | Allowed operations for the grant.
  # home_region        = ""     # string | computed | Home Region of the grant.
  # license_arn        = ""     # string | computed | License ARN.
  # name               = ""     # string | computed | Name of the grant.
  # parent_arn         = ""     # string | computed | Parent ARN.
  # principal          = ""     # string | computed | The grantee principal ARN.
  # status             = ""     # string | computed | GrantAccepter status.
  # version            = ""     # string | computed | GrantAccepter version.

}

