# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_quicksight_namespace                            │
# └──────────────────────────────────────────────────────────────┘
resource "aws_quicksight_namespace" "this" {

  namespace       = ""     # string | required
  aws_account_id  = ""     # string | optional+computed
  identity_store  = ""     # string | optional+computed
  tags            = {}     # map(string) | optional

  # arn             = ""     # string | computed
  # capacity_region = ""     # string | computed
  # creation_status = ""     # string | computed
  # id              = ""     # string | computed
  # tags_all        = {}     # map(string) | computed

  timeouts { # single
    create = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…
    delete = ""     # string | optional | A string that can be [parsed as a duration](https://pkg.go.d…

  }

}

