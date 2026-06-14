# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_transcribe_language_model                       │
# └──────────────────────────────────────────────────────────────┘
resource "aws_transcribe_language_model" "this" {

  base_model_name = ""     # string | required
  language_code   = ""     # string | required
  model_name      = ""     # string | required
  id              = ""     # string | optional+computed
  tags            = {}     # map(string) | optional
  tags_all        = {}     # map(string) | optional+computed

  # arn             = ""     # string | computed

  input_data_config { # list [1..1]
    data_access_role_arn = ""     # string | required
    s3_uri               = ""     # string | required
    tuning_data_s3_uri   = ""     # string | optional+computed

  }

  timeouts { # single
    create = ""     # string | optional

  }

}

