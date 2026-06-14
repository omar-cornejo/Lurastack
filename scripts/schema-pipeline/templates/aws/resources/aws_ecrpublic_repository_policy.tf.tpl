# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ecrpublic_repository_policy                     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ecrpublic_repository_policy" "this" {

  policy          = ""     # string | required
  repository_name = ""     # string | required
  id              = ""     # string | optional+computed

  # registry_id     = ""     # string | computed

}

