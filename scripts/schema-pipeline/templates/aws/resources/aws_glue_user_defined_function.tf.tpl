# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_glue_user_defined_function                      │
# └──────────────────────────────────────────────────────────────┘
resource "aws_glue_user_defined_function" "this" {

  class_name    = ""     # string | required
  database_name = ""     # string | required
  name          = ""     # string | required
  owner_name    = ""     # string | required
  owner_type    = ""     # string | required
  catalog_id    = ""     # string | optional
  id            = ""     # string | optional+computed

  # arn           = ""     # string | computed
  # create_time   = ""     # string | computed

  resource_uris { # set [0..1000]
    resource_type = ""     # string | required
    uri           = ""     # string | required

  }

}

