# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_codepipeline_custom_action_type                 │
# └──────────────────────────────────────────────────────────────┘
resource "aws_codepipeline_custom_action_type" "this" {

  category      = ""     # string | required
  provider_name = ""     # string | required
  version       = ""     # string | required
  id            = ""     # string | optional+computed
  tags          = {}     # map(string) | optional
  tags_all      = {}     # map(string) | optional+computed

  # arn           = ""     # string | computed
  # owner         = ""     # string | computed

  configuration_property { # list [0..10]
    key         = false  # bool | required
    name        = ""     # string | required
    required    = false  # bool | required
    secret      = false  # bool | required
    description = ""     # string | optional
    queryable   = false  # bool | optional
    type        = ""     # string | optional

  }

  input_artifact_details { # list [1..1]
    maximum_count = 0      # number | required
    minimum_count = 0      # number | required

  }

  output_artifact_details { # list [1..1]
    maximum_count = 0      # number | required
    minimum_count = 0      # number | required

  }

  settings { # list [0..1]
    entity_url_template           = ""     # string | optional
    execution_url_template        = ""     # string | optional
    revision_url_template         = ""     # string | optional
    third_party_configuration_url = ""     # string | optional

  }

}

