# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_datazone_environment_blueprint_configuration    │
# └──────────────────────────────────────────────────────────────┘
resource "aws_datazone_environment_blueprint_configuration" "this" {

  domain_id                = ""     # string | required
  enabled_regions          = []     # list(string) | required
  environment_blueprint_id = ""     # string | required
  manage_access_role_arn   = ""     # string | optional
  provisioning_role_arn    = ""     # string | optional
  regional_parameters      = {}     # map(map(string)) | optional

}

