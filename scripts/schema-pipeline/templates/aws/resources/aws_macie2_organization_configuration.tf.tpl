# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_macie2_organization_configuration               │
# └──────────────────────────────────────────────────────────────┘
resource "aws_macie2_organization_configuration" "this" {

  auto_enable = false  # bool | required | Whether to enable Amazon Macie automatically for accounts th…

}

