# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_sagemaker_notebook_instance_lifecycle_configuration  │
# └──────────────────────────────────────────────────────────────┘
resource "aws_sagemaker_notebook_instance_lifecycle_configuration" "this" {

  id        = ""     # string | optional+computed
  name      = ""     # string | optional
  on_create = ""     # string | optional
  on_start  = ""     # string | optional
  tags      = {}     # map(string) | optional
  tags_all  = {}     # map(string) | optional+computed

  # arn       = ""     # string | computed

}

