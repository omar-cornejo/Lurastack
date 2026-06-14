# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_msk_single_scram_secret_association             │
# └──────────────────────────────────────────────────────────────┘
resource "aws_msk_single_scram_secret_association" "this" {

  cluster_arn = ""     # string | required
  secret_arn  = ""     # string | required

  # id          = ""     # string | computed

}

