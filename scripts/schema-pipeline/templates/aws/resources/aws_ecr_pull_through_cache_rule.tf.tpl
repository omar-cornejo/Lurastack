# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_ecr_pull_through_cache_rule                     │
# └──────────────────────────────────────────────────────────────┘
resource "aws_ecr_pull_through_cache_rule" "this" {

  ecr_repository_prefix      = ""     # string | required
  upstream_registry_url      = ""     # string | required
  credential_arn             = ""     # string | optional
  custom_role_arn            = ""     # string | optional
  id                         = ""     # string | optional+computed
  upstream_repository_prefix = ""     # string | optional

  # registry_id                = ""     # string | computed

}

