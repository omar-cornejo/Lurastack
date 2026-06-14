# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_datazone_form_type                              │
# └──────────────────────────────────────────────────────────────┘
resource "aws_datazone_form_type" "this" {

  domain_identifier         = ""     # string | required
  name                      = ""     # string | required
  owning_project_identifier = ""     # string | required
  description               = ""     # string | optional
  status                    = ""     # string | optional+computed

  # created_at                = ""     # string | computed
  # created_by                = ""     # string | computed
  # imports = [  # list(object)
  #   {
  #     name = ""
  #     revision = ""
  #   }
  # ]
  # origin_domain_id          = ""     # string | computed
  # origin_project_id         = ""     # string | computed
  # revision                  = ""     # string | computed

  model { # list
    smithy = ""     # string | required

  }

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}

