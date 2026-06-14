# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_servicecatalogappregistry_attribute_group       │
# └──────────────────────────────────────────────────────────────┘
resource "aws_servicecatalogappregistry_attribute_group" "this" {

  attributes  = ""     # string | required
  name        = ""     # string | required
  description = ""     # string | optional
  tags        = {}     # map(string) | optional

  # arn         = ""     # string | computed
  # id          = ""     # string | computed
  # tags_all    = {}     # map(string) | computed

}

