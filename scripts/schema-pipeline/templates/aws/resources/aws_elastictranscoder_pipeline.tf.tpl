# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_elastictranscoder_pipeline                      │
# └──────────────────────────────────────────────────────────────┘
resource "aws_elastictranscoder_pipeline" "this" {

  input_bucket    = ""     # string | required
  role            = ""     # string | required
  aws_kms_key_arn = ""     # string | optional
  id              = ""     # string | optional+computed
  name            = ""     # string | optional+computed
  output_bucket   = ""     # string | optional+computed

  # arn             = ""     # string | computed

  content_config { # list [0..1]
    bucket        = ""     # string | optional+computed
    storage_class = ""     # string | optional

  }

  content_config_permissions { # set
    access       = []     # list(string) | optional
    grantee      = ""     # string | optional
    grantee_type = ""     # string | optional

  }

  notifications { # list [0..1]
    completed   = ""     # string | optional
    error       = ""     # string | optional
    progressing = ""     # string | optional
    warning     = ""     # string | optional

  }

  thumbnail_config { # list [0..1]
    bucket        = ""     # string | optional+computed
    storage_class = ""     # string | optional

  }

  thumbnail_config_permissions { # set
    access       = []     # list(string) | optional
    grantee      = ""     # string | optional
    grantee_type = ""     # string | optional

  }

}

