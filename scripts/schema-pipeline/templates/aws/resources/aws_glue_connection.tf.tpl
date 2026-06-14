# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_glue_connection                                 │
# └──────────────────────────────────────────────────────────────┘
resource "aws_glue_connection" "this" {

  name                  = ""     # string | required
  athena_properties     = {}     # map(string) | optional+sensitive
  catalog_id            = ""     # string | optional+computed
  connection_properties = {}     # map(string) | optional+sensitive
  connection_type       = ""     # string | optional
  description           = ""     # string | optional
  id                    = ""     # string | optional+computed
  match_criteria        = []     # list(string) | optional
  tags                  = {}     # map(string) | optional
  tags_all              = {}     # map(string) | optional+computed

  # arn                   = ""     # string | computed

  physical_connection_requirements { # list [0..1]
    availability_zone      = ""     # string | optional
    security_group_id_list = []     # set(string) | optional
    subnet_id              = ""     # string | optional

  }

}

