# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_comprehend_entity_recognizer                    │
# └──────────────────────────────────────────────────────────────┘
resource "aws_comprehend_entity_recognizer" "this" {

  data_access_role_arn = ""     # string | required
  language_code        = ""     # string | required
  name                 = ""     # string | required
  id                   = ""     # string | optional+computed
  model_kms_key_id     = ""     # string | optional
  tags                 = {}     # map(string) | optional
  tags_all             = {}     # map(string) | optional+computed
  version_name         = ""     # string | optional+computed
  version_name_prefix  = ""     # string | optional+computed
  volume_kms_key_id    = ""     # string | optional

  # arn                  = ""     # string | computed

  input_data_config { # list [1..1]
    data_format = ""     # string | optional

    annotations { # list [0..1]
      s3_uri      = ""     # string | required
      test_s3_uri = ""     # string | optional

    }

    augmented_manifests { # set
      attribute_names         = []     # list(string) | required
      s3_uri                  = ""     # string | required
      annotation_data_s3_uri  = ""     # string | optional
      document_type           = ""     # string | optional
      source_documents_s3_uri = ""     # string | optional
      split                   = ""     # string | optional

    }

    documents { # list [0..1]
      s3_uri       = ""     # string | required
      input_format = ""     # string | optional
      test_s3_uri  = ""     # string | optional

    }

    entity_list { # list [0..1]
      s3_uri = ""     # string | required

    }

    entity_types { # set [1..25]
      type = ""     # string | required

    }

  }

  timeouts { # single
    create = ""     # string | optional
    delete = ""     # string | optional
    update = ""     # string | optional

  }

  vpc_config { # list [0..1]
    security_group_ids = []     # set(string) | required
    subnets            = []     # set(string) | required

  }

}

