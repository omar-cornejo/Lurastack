# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_codeconnections_host                            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_codeconnections_host" "this" {

  name              = ""     # string | required
  provider_endpoint = ""     # string | required
  provider_type     = ""     # string | required
  tags              = {}     # map(string) | optional

  # arn               = ""     # string | computed
  # id                = ""     # string | computed
  # tags_all          = {}     # map(string) | computed

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    delete = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    update = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

  vpc_configuration { # list
    security_group_ids = []     # set(string) | required
    subnet_ids         = []     # set(string) | required
    vpc_id             = ""     # string | required
    tls_certificate    = ""     # string | optional

  }

}

