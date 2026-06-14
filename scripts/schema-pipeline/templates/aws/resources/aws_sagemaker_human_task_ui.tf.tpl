# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_sagemaker_human_task_ui                         │
# └──────────────────────────────────────────────────────────────┘
resource "aws_sagemaker_human_task_ui" "this" {

  human_task_ui_name = ""     # string | required
  id                 = ""     # string | optional+computed
  tags               = {}     # map(string) | optional
  tags_all           = {}     # map(string) | optional+computed

  # arn                = ""     # string | computed

  ui_template { # list [1..1]
    content        = ""     # string | optional

    # content_sha256 = ""     # string | computed
    # url            = ""     # string | computed

  }

}

