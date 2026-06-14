# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_elasticsearch_vpc_endpoint                      │
# └──────────────────────────────────────────────────────────────┘
resource "aws_elasticsearch_vpc_endpoint" "this" {

  domain_arn = ""     # string | required
  id         = ""     # string | optional+computed

  # endpoint   = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

  vpc_options { # list [1..1]
    subnet_ids         = []     # set(string) | required
    security_group_ids = []     # set(string) | optional+computed

    # availability_zones = []     # set(string) | computed
    # vpc_id             = ""     # string | computed

  }

}

