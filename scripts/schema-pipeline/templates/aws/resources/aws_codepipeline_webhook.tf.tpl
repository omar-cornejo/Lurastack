# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_codepipeline_webhook                            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_codepipeline_webhook" "this" {

  authentication  = ""     # string | required
  name            = ""     # string | required
  target_action   = ""     # string | required
  target_pipeline = ""     # string | required
  id              = ""     # string | optional+computed
  tags            = {}     # map(string) | optional
  tags_all        = {}     # map(string) | optional+computed

  # arn             = ""     # string | computed
  # url             = ""     # string | computed

  authentication_configuration { # list [0..1]
    allowed_ip_range = ""     # string | optional
    secret_token     = ""     # string | optional+sensitive

  }

  filter { # set [1..5]
    json_path    = ""     # string | required
    match_equals = ""     # string | required

  }

}

