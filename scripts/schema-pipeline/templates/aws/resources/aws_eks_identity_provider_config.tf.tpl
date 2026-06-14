# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_eks_identity_provider_config                    │
# └──────────────────────────────────────────────────────────────┘
resource "aws_eks_identity_provider_config" "this" {

  cluster_name = ""     # string | required
  id           = ""     # string | optional+computed
  tags         = {}     # map(string) | optional
  tags_all     = {}     # map(string) | optional+computed

  # arn          = ""     # string | computed
  # status       = ""     # string | computed

  oidc { # list [1..1]
    client_id                     = ""     # string | required
    identity_provider_config_name = ""     # string | required
    issuer_url                    = ""     # string | required
    groups_claim                  = ""     # string | optional
    groups_prefix                 = ""     # string | optional
    required_claims               = {}     # map(string) | optional
    username_claim                = ""     # string | optional
    username_prefix               = ""     # string | optional

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional

  }

}

