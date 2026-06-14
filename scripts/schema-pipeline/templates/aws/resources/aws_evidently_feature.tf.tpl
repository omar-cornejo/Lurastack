# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_evidently_feature                               │
# └──────────────────────────────────────────────────────────────┘
resource "aws_evidently_feature" "this" {

  name                = ""     # string | required
  project             = ""     # string | required
  default_variation   = ""     # string | optional+computed
  description         = ""     # string | optional
  entity_overrides    = {}     # map(string) | optional
  evaluation_strategy = ""     # string | optional+computed
  id                  = ""     # string | optional+computed
  tags                = {}     # map(string) | optional
  tags_all            = {}     # map(string) | optional+computed

  # arn                 = ""     # string | computed
  # created_time        = ""     # string | computed
  # evaluation_rules = [  # set(object)
  #   {
  #     name = ""
  #     type = ""
  #   }
  # ]
  # last_updated_time   = ""     # string | computed
  # status              = ""     # string | computed
  # value_type          = ""     # string | computed

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

  variations { # set [1..5]
    name = ""     # string | required

    value { # list [1..1]
      bool_value   = ""     # string | optional
      double_value = ""     # string | optional
      long_value   = ""     # string | optional
      string_value = ""     # string | optional

    }

  }

}

