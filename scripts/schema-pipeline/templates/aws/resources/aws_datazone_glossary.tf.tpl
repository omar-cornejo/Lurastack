# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_datazone_glossary                               │
# └──────────────────────────────────────────────────────────────┘
resource "aws_datazone_glossary" "this" {

  domain_identifier         = ""     # string | required
  name                      = ""     # string | required
  owning_project_identifier = ""     # string | required
  description               = ""     # string | optional
  status                    = ""     # string | optional

  # id                        = ""     # string | computed

}

