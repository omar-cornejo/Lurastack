# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_servicecatalog_budget_resource_association      │
# └──────────────────────────────────────────────────────────────┘
resource "aws_servicecatalog_budget_resource_association" "this" {

  budget_name = ""     # string | required
  resource_id = ""     # string | required
  id          = ""     # string | optional+computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    read   = ""     # string | optional

  }

}

