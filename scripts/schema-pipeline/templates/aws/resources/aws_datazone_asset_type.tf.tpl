# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_datazone_asset_type                             │
# └──────────────────────────────────────────────────────────────┘
resource "aws_datazone_asset_type" "this" {

  domain_identifier         = ""     # string | required
  name                      = ""     # string | required
  owning_project_identifier = ""     # string | required
  description               = ""     # string | optional

  # created_at                = ""     # string | computed
  # created_by                = ""     # string | computed
  # revision                  = ""     # string | computed

  forms_input { # set
    map_block_key   = ""     # string | required
    type_identifier = ""     # string | required
    type_revision   = ""     # string | required
    required        = false  # bool | optional

  }

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}

