# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_servicecatalogappregistry_attribute_group_association  │
# └──────────────────────────────────────────────────────────────┘
resource "aws_servicecatalogappregistry_attribute_group_association" "this" {

  application_id     = ""     # string | required | ID of the application.
  attribute_group_id = ""     # string | required | ID of the attribute group to associate with the application.

}

