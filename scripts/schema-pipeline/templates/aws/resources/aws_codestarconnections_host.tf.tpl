# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_codestarconnections_host                        │
# └──────────────────────────────────────────────────────────────┘
resource "aws_codestarconnections_host" "this" {

  name              = ""     # string | required
  provider_endpoint = ""     # string | required
  provider_type     = ""     # string | required
  id                = ""     # string | optional+computed

  # arn               = ""     # string | computed
  # status            = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

  vpc_configuration { # list [0..1]
    security_group_ids = []     # set(string) | required
    subnet_ids         = []     # set(string) | required
    vpc_id             = ""     # string | required
    tls_certificate    = ""     # string | optional

  }

}

