# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_ecr_repository_creation_template                    │
# └──────────────────────────────────────────────────────────────┘
data "aws_ecr_repository_creation_template" "this" {

  prefix                   = ""     # string | required
  id                       = ""     # string | optional+computed
  resource_tags            = {}     # map(string) | optional+computed

  # applied_for              = []     # set(string) | computed
  # custom_role_arn          = ""     # string | computed
  # description              = ""     # string | computed
  # encryption_configuration = [  # list(object)
  #   {
  #     encryption_type = ""
  #     kms_key = ""
  #   }
  # ]
  # image_tag_mutability     = ""     # string | computed
  # lifecycle_policy         = ""     # string | computed
  # registry_id              = ""     # string | computed
  # repository_policy        = ""     # string | computed

}

