# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_kendra_experience                               │
# └──────────────────────────────────────────────────────────────┘
resource "aws_kendra_experience" "this" {

  index_id      = ""     # string | required
  name          = ""     # string | required
  role_arn      = ""     # string | required
  description   = ""     # string | optional
  id            = ""     # string | optional+computed

  # arn           = ""     # string | computed
  # endpoints = [  # set(object)
  #   {
  #     endpoint = ""
  #     endpoint_type = ""
  #   }
  # ]
  # experience_id = ""     # string | computed
  # status        = ""     # string | computed

  configuration { # list [0..1]

    content_source_configuration { # list [0..1]
      data_source_ids    = []     # set(string) | optional
      direct_put_content = false  # bool | optional
      faq_ids            = []     # set(string) | optional

    }

    user_identity_configuration { # list [0..1]
      identity_attribute_name = ""     # string | required

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

}

