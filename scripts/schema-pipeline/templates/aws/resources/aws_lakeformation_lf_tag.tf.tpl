# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_lakeformation_lf_tag                            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_lakeformation_lf_tag" "this" {

  key        = ""     # string | required
  values     = []     # set(string) | required
  catalog_id = ""     # string | optional+computed
  id         = ""     # string | optional+computed

}

