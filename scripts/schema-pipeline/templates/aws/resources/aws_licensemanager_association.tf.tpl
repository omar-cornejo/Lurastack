# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_licensemanager_association                      │
# └──────────────────────────────────────────────────────────────┘
resource "aws_licensemanager_association" "this" {

  license_configuration_arn = ""     # string | required
  resource_arn              = ""     # string | required
  id                        = ""     # string | optional+computed

}

