# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_kendra_experience                                   │
# └──────────────────────────────────────────────────────────────┘
data "aws_kendra_experience" "this" {

  experience_id = ""     # string | required
  index_id      = ""     # string | required
  id            = ""     # string | optional+computed

  # arn           = ""     # string | computed
  # configuration = [  # list(object)
  #   {
  #     content_source_configuration = [  # list(object)
  #       {
  #         data_source_ids = []  # set(string)
  #         direct_put_content = false
  #         faq_ids = []  # set(string)
  #       }
  #     ]
  #     user_identity_configuration = [  # list(object)
  #       {
  #         identity_attribute_name = ""
  #       }
  #     ]
  #   }
  # ]
  # created_at    = ""     # string | computed
  # description   = ""     # string | computed
  # endpoints = [  # set(object)
  #   {
  #     endpoint = ""
  #     endpoint_type = ""
  #   }
  # ]
  # error_message = ""     # string | computed
  # name          = ""     # string | computed
  # role_arn      = ""     # string | computed
  # status        = ""     # string | computed
  # updated_at    = ""     # string | computed

}

