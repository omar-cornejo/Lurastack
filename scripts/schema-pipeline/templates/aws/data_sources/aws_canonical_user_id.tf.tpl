# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_canonical_user_id                                   │
# └──────────────────────────────────────────────────────────────┘
data "aws_canonical_user_id" "this" {

  id           = ""     # string | optional+computed

  # display_name = ""     # string | computed

}

