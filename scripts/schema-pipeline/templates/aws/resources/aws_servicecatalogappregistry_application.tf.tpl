# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_servicecatalogappregistry_application           │
# └──────────────────────────────────────────────────────────────┘
resource "aws_servicecatalogappregistry_application" "this" {

  name            = ""     # string | required
  description     = ""     # string | optional
  tags            = {}     # map(string) | optional

  # application_tag = {}     # map(string) | computed
  # arn             = ""     # string | computed
  # id              = ""     # string | computed
  # tags_all        = {}     # map(string) | computed

}

