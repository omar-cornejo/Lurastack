# ┌──────────────────────────────────────────────────────────────┐
# │  data: aws_iam_openid_connect_provider                         │
# └──────────────────────────────────────────────────────────────┘
data "aws_iam_openid_connect_provider" "this" {

  arn             = ""     # string | optional+computed
  id              = ""     # string | optional+computed
  tags            = {}     # map(string) | optional+computed
  url             = ""     # string | optional+computed

  # client_id_list  = []     # list(string) | computed
  # thumbprint_list = []     # list(string) | computed

}

