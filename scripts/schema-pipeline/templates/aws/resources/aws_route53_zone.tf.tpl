# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_route53_zone                                    │
# └──────────────────────────────────────────────────────────────┘
resource "aws_route53_zone" "this" {

  name                = ""     # string | required
  comment             = ""     # string | optional
  delegation_set_id   = ""     # string | optional
  force_destroy       = false  # bool | optional
  id                  = ""     # string | optional+computed
  tags                = {}     # map(string) | optional
  tags_all            = {}     # map(string) | optional+computed

  # arn                 = ""     # string | computed
  # name_servers        = []     # list(string) | computed
  # primary_name_server = ""     # string | computed
  # zone_id             = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

  vpc { # set
    vpc_id     = ""     # string | required
    vpc_region = ""     # string | optional+computed

  }

}

