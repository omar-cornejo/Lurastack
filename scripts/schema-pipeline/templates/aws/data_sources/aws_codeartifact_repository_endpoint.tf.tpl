# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_codeartifact_repository_endpoint                    │
# └──────────────────────────────────────────────────────────────┘
data "aws_codeartifact_repository_endpoint" "this" {

  domain              = ""     # string | required
  format              = ""     # string | required
  repository          = ""     # string | required
  domain_owner        = ""     # string | optional+computed
  id                  = ""     # string | optional+computed

  # repository_endpoint = ""     # string | computed

}

