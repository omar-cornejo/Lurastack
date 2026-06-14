# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_codecommit_repository                               │
# └──────────────────────────────────────────────────────────────┘
data "aws_codecommit_repository" "this" {

  repository_name = ""     # string | required
  id              = ""     # string | optional+computed

  # arn             = ""     # string | computed
  # clone_url_http  = ""     # string | computed
  # clone_url_ssh   = ""     # string | computed
  # kms_key_id      = ""     # string | computed
  # repository_id   = ""     # string | computed

}

