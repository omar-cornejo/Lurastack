# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_ecr_pull_through_cache_rule                         │
# └──────────────────────────────────────────────────────────────┘
data "aws_ecr_pull_through_cache_rule" "this" {

  ecr_repository_prefix      = ""     # string | required
  id                         = ""     # string | optional+computed

  # credential_arn             = ""     # string | computed
  # custom_role_arn            = ""     # string | computed
  # registry_id                = ""     # string | computed
  # upstream_registry_url      = ""     # string | computed
  # upstream_repository_prefix = ""     # string | computed

}

