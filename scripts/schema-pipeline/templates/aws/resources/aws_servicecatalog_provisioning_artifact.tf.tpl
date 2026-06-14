# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_servicecatalog_provisioning_artifact            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_servicecatalog_provisioning_artifact" "this" {

  product_id                  = ""     # string | required
  accept_language             = ""     # string | optional
  active                      = false  # bool | optional
  description                 = ""     # string | optional+computed
  disable_template_validation = false  # bool | optional
  guidance                    = ""     # string | optional
  id                          = ""     # string | optional+computed
  name                        = ""     # string | optional+computed
  template_physical_id        = ""     # string | optional
  template_url                = ""     # string | optional
  type                        = ""     # string | optional

  # created_time                = ""     # string | computed
  # provisioning_artifact_id    = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    read   = ""     # string | optional
    update = ""     # string | optional

  }

}

