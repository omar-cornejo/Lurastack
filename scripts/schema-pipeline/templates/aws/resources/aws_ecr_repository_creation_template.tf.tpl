# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ecr_repository_creation_template                │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ecr_repository_creation_template" "this" {

  applied_for          = []     # set(string) | required
  prefix               = ""     # string | required
  custom_role_arn      = ""     # string | optional
  description          = ""     # string | optional
  id                   = ""     # string | optional+computed
  image_tag_mutability = ""     # string | optional
  lifecycle_policy     = ""     # string | optional
  repository_policy    = ""     # string | optional
  resource_tags        = {}     # map(string) | optional

  # registry_id          = ""     # string | computed

  encryption_configuration { # list
    encryption_type = ""     # string | optional
    kms_key         = ""     # string | optional+computed

  }

}

