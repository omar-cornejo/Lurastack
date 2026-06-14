# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_sagemaker_code_repository                       │
# └──────────────────────────────────────────────────────────────┘
resource "aws_sagemaker_code_repository" "this" {

  code_repository_name = ""     # string | required
  id                   = ""     # string | optional+computed
  tags                 = {}     # map(string) | optional
  tags_all             = {}     # map(string) | optional+computed

  # arn                  = ""     # string | computed

  git_config { # list [1..1]
    repository_url = ""     # string | required
    branch         = ""     # string | optional
    secret_arn     = ""     # string | optional

  }

}

