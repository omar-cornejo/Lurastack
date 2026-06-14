# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_serverlessapplicationrepository_application         │
# └──────────────────────────────────────────────────────────────┘
data "aws_serverlessapplicationrepository_application" "this" {

  application_id        = ""     # string | required
  id                    = ""     # string | optional+computed
  semantic_version      = ""     # string | optional+computed

  # name                  = ""     # string | computed
  # required_capabilities = []     # set(string) | computed
  # source_code_url       = ""     # string | computed
  # template_url          = ""     # string | computed

}

