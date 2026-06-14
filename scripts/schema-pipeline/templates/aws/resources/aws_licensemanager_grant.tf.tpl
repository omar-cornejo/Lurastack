# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_licensemanager_grant                            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_licensemanager_grant" "this" {

  allowed_operations = []     # set(string) | required | Allowed operations for the grant. This is a subset of the al…
  license_arn        = ""     # string | required | License ARN.
  name               = ""     # string | required | Name of the grant.
  principal          = ""     # string | required | The grantee principal ARN. The target account for the grant …
  id                 = ""     # string | optional+computed

  # arn                = ""     # string | computed | Amazon Resource Name (ARN) of the grant.
  # home_region        = ""     # string | computed | Home Region of the grant.
  # parent_arn         = ""     # string | computed | Parent ARN.
  # status             = ""     # string | computed | Grant status.
  # version            = ""     # string | computed | Grant version.

}

