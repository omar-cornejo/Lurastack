# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_lambda_code_signing_config                      │
# └──────────────────────────────────────────────────────────────┘
resource "aws_lambda_code_signing_config" "this" {

  description   = ""     # string | optional
  id            = ""     # string | optional+computed
  tags          = {}     # map(string) | optional
  tags_all      = {}     # map(string) | optional+computed

  # arn           = ""     # string | computed
  # config_id     = ""     # string | computed
  # last_modified = ""     # string | computed

  allowed_publishers { # list [1..1]
    signing_profile_version_arns = []     # set(string) | required

  }

  policies { # list [0..1]
    untrusted_artifact_on_deployment = ""     # string | required

  }

}

