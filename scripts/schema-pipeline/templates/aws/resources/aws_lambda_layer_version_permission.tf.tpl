# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_lambda_layer_version_permission                 │
# └──────────────────────────────────────────────────────────────┘
resource "aws_lambda_layer_version_permission" "this" {

  action          = ""     # string | required
  layer_name      = ""     # string | required
  principal       = ""     # string | required
  statement_id    = ""     # string | required
  version_number  = 0      # number | required
  id              = ""     # string | optional+computed
  organization_id = ""     # string | optional
  skip_destroy    = false  # bool | optional

  # policy          = ""     # string | computed
  # revision_id     = ""     # string | computed

}

