# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_datapipeline_pipeline_definition                │
# └──────────────────────────────────────────────────────────────┘
resource "aws_datapipeline_pipeline_definition" "this" {

  pipeline_id = ""     # string | required
  id          = ""     # string | optional+computed

  parameter_object { # set
    id = ""     # string | required

    attribute { # set
      key          = ""     # string | required
      string_value = ""     # string | required

    }

  }

  parameter_value { # set
    id           = ""     # string | required
    string_value = ""     # string | required

  }

  pipeline_object { # set [1..*]
    id   = ""     # string | required
    name = ""     # string | required

    field { # set
      key          = ""     # string | required
      ref_value    = ""     # string | optional
      string_value = ""     # string | optional

    }

  }

}

