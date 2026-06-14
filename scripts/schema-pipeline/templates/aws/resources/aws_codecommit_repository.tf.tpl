# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_codecommit_repository                           │
# └──────────────────────────────────────────────────────────────┘
resource "aws_codecommit_repository" "this" {

  repository_name = ""     # string | required
  default_branch  = ""     # string | optional
  description     = ""     # string | optional
  id              = ""     # string | optional+computed
  kms_key_id      = ""     # string | optional+computed
  tags            = {}     # map(string) | optional
  tags_all        = {}     # map(string) | optional+computed

  # arn             = ""     # string | computed
  # clone_url_http  = ""     # string | computed
  # clone_url_ssh   = ""     # string | computed
  # repository_id   = ""     # string | computed

}

