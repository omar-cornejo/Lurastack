# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_codeartifact_repository                         │
# └──────────────────────────────────────────────────────────────┘
resource "aws_codeartifact_repository" "this" {

  domain                = ""     # string | required
  repository            = ""     # string | required
  description           = ""     # string | optional
  domain_owner          = ""     # string | optional+computed
  id                    = ""     # string | optional+computed
  tags                  = {}     # map(string) | optional
  tags_all              = {}     # map(string) | optional+computed

  # administrator_account = ""     # string | computed
  # arn                   = ""     # string | computed

  external_connections { # list [0..1]
    external_connection_name = ""     # string | required

    # package_format           = ""     # string | computed
    # status                   = ""     # string | computed

  }

  upstream { # list
    repository_name = ""     # string | required

  }

}

