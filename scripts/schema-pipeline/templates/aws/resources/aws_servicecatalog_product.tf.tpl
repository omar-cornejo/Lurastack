# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_servicecatalog_product                          │
# └──────────────────────────────────────────────────────────────┘
resource "aws_servicecatalog_product" "this" {

  name                = ""     # string | required
  owner               = ""     # string | required
  type                = ""     # string | required
  accept_language     = ""     # string | optional
  description         = ""     # string | optional+computed
  distributor         = ""     # string | optional+computed
  id                  = ""     # string | optional+computed
  support_description = ""     # string | optional+computed
  support_email       = ""     # string | optional+computed
  support_url         = ""     # string | optional+computed
  tags                = {}     # map(string) | optional
  tags_all            = {}     # map(string) | optional+computed

  # arn                 = ""     # string | computed
  # created_time        = ""     # string | computed
  # has_default_path    = false  # bool | computed
  # status              = ""     # string | computed

  provisioning_artifact_parameters { # list [1..1]
    description                 = ""     # string | optional
    disable_template_validation = false  # bool | optional
    name                        = ""     # string | optional
    template_physical_id        = ""     # string | optional
    template_url                = ""     # string | optional
    type                        = ""     # string | optional

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    read   = ""     # string | optional
    update = ""     # string | optional

  }

}

