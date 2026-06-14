# ┌──────────────────────────────────────────────────────────────┐
# │  resource: aws_msk_scram_secret_association                    │
# └──────────────────────────────────────────────────────────────┘
resource "aws_msk_scram_secret_association" "this" {

  cluster_arn     = ""     # string | required
  secret_arn_list = []     # set(string) | required
  id              = ""     # string | optional+computed

}

