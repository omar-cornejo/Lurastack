# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_comprehend_document_classifier                  │
# └──────────────────────────────────────────────────────────────┘
resource "aws_comprehend_document_classifier" "this" {

  data_access_role_arn = ""     # string | required
  language_code        = ""     # string | required
  name                 = ""     # string | required
  id                   = ""     # string | optional+computed
  mode                 = ""     # string | optional
  model_kms_key_id     = ""     # string | optional
  tags                 = {}     # map(string) | optional
  tags_all             = {}     # map(string) | optional+computed
  version_name         = ""     # string | optional+computed
  version_name_prefix  = ""     # string | optional+computed
  volume_kms_key_id    = ""     # string | optional

  # arn                  = ""     # string | computed

  input_data_config { # list [1..1]
    data_format     = ""     # string | optional
    label_delimiter = ""     # string | optional+computed
    s3_uri          = ""     # string | optional
    test_s3_uri     = ""     # string | optional

    augmented_manifests { # set
      attribute_names         = []     # list(string) | required
      s3_uri                  = ""     # string | required
      annotation_data_s3_uri  = ""     # string | optional
      document_type           = ""     # string | optional
      source_documents_s3_uri = ""     # string | optional
      split                   = ""     # string | optional

    }

  }

  output_data_config { # list [0..1]
    s3_uri        = ""     # string | required
    kms_key_id    = ""     # string | optional

    # output_s3_uri = ""     # string | computed

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

