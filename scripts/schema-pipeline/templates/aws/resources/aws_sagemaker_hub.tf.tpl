# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_sagemaker_hub                                   │
# └──────────────────────────────────────────────────────────────┘
resource "aws_sagemaker_hub" "this" {

  hub_description     = ""     # string | required
  hub_name            = ""     # string | required
  hub_display_name    = ""     # string | optional
  hub_search_keywords = []     # set(string) | optional
  id                  = ""     # string | optional+computed
  tags                = {}     # map(string) | optional
  tags_all            = {}     # map(string) | optional+computed

  # arn                 = ""     # string | computed

  s3_storage_config { # list [0..1]
    s3_output_path = ""     # string | optional

  }

}

